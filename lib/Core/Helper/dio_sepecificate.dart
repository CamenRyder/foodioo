// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';

import 'dart:io';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodioo/core/constants/constant_stataue.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import '../../main.dart';
import '../../repositories/authentication/auth_bloc.dart';
import '../../repositories/authentication/auth_event.dart';
import 'helper_function.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

class FetchClient {
  String get domain {
    return AppConstant.apiBaseURL;
  }

  static String token = '';

  Dio dio = Dio();

  List<String> curlList = [];

  logRequest() {
    dio.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
    // if (AppConstants.mod == "develop") {
    //   dio.interceptors.add(InterceptorsWrapper(
    //     onRequest: (options, handler) {
    //       getCurlFromDioRequest(options);
    //       return handler.next(options);
    //     },
    //   ));
    // }

    // dio.interceptors.add(PrettyDioLogger(
    //   maxWidth: 1000,
    //   requestHeader: true,
    //   requestBody: true,
    //   responseBody: true,
    //   responseHeader: false,
    //   compact: false,
    // ));
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        String keyToken = dotenv.env['KEY_TOKEN'] ?? '';
        String accessToken = GetStorage().read(keyToken) ?? '';
        // String refeshToken = data.data['refesh_token'] ?? '';
        String keyRefeshToken = dotenv.env['KEY_REFESH_TOKEN'] ?? '';
        String refeshToken = GetStorage().read(keyRefeshToken) ?? '';
        // if(checkTokenTimeWithCurrent(token: token)) {
        if (accessToken == '' || refeshToken == '' || token == '') {
          return handler.next(options);
        } else {
          bool isExpired = checkTokenTimeWithCurrent(token: token);
          if (isExpired) {
            try {
              // var url = Uri.http( domain ,'/users/refesh');
              final url = '$domain/users/refesh';
              final response = await http.Client()
                  .post(Uri.parse(url), body: {'refresh_token': refeshToken});
              // final response = await  .post(
              //   '$domain/users/refesh',
              //   data: {'refesh_token': refeshToken},
              // );
              var decodedResponse =
                  jsonDecode(utf8.decode(response.bodyBytes)) as Map;
              if (response.statusCode == 200) {
                //! EXPIRED SESSION
                if (decodedResponse['code'] == 201) {
                  final newAccessToken =
                      decodedResponse["data"]['access_token'];
                  options.headers['Authorization'] = "Bearer $newAccessToken";
                  GetStorage().write(keyToken, newAccessToken);
                  token = newAccessToken;
                  return handler.next(options);
                } else {
                  logout();
                }
              } else {
                logout();
              }
              return handler.next(options);
            } catch (e) {
              logout();
              // return handler.reject(e, true);
            }
            // return handler.next(options);
          } else {
            options.headers['Authorization'] = "Bearer $accessToken";
            return handler.next(options);
          }
        }
        // }
      },
      onResponse: (response, handler) {
        // if (response.statusCode == 401) {
        //   _handleUnauthorized(response, handler);
        //   return handler.next(response);
        // } else if (response.statusCode == 200 && response.data != null) {
        //   var responseData = response.data;
        //   if (responseData['code'] == 40101) {
        //     _handleUnauthorized(response, handler);
        //     return handler.next(response);
        //     // var errors = responseData['code'];
        //     // if (errors is List) {
        //     //   if (errors[0]['message'] != null) {
        //     //     if (errors[0]['message'] == 'Unauthorized') {
        //     //       _handleUnauthorized(response, handler);
        //     //       return handler.next(response);
        //     //     }
        //     //   }
        //     // }
        //   }
        // }
        handler.next(response);
      },
      onError: (DioException error, handler) {
        if (error.error is SocketException) {
          final authBloc =
              BlocProvider.of<AuthBloc>(navigatorKey.currentContext!);
          authBloc.add(AuthNetworkError());
          return handler.next(error);
        }
        return handler.next(error);
      },
    ));
  }

  void logout() async {
    final authBloc = navigatorKey.currentContext != null
        ? BlocProvider.of<AuthBloc>(navigatorKey.currentContext!)
        : AuthBloc();
    authBloc.add(Logout());
  }

  void getCurlFromDioRequest(RequestOptions options) {
    String curl = 'curl -X ${options.method}';

    curl += ' "${options.uri.toString()}"';

    options.headers.forEach((key, value) {
      curl += ' -H "$key: $value"';
    });
    if (options.data != null) {
      if (options.data is Map) {
        options.data.forEach((key, value) {
          curl += ' --data "$key=$value"';
        });
      } else {
        curl += ' --data "${options.data.toString()}"';
      }
    }

    if (curlList.length >= 50) {
      curlList.removeAt(0);
    }

    curlList.add(curl);
    print(curl);

    Clipboard.setData(ClipboardData(
        text: curlList.join('**************************\n\n\n\n\'')));
  }

  Options options() {
    var option = Options(
        headers: {
          // 'x-application-name': 'PMS-APP', // config sau khi  sử dụng
          'Authorization': token.isEmpty ? '' : ('Bearer $token')
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
        sendTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60));
    return option;
  }

  Future<Response> getData(
      {String? domainApp,
      required String path,
      Options? optionsAlternative,
      Map<String, dynamic>? queryParameters}) async {
    try {
      logRequest();
      Response<dynamic> result = await dio.get((domainApp ?? domain) + path,
          queryParameters: queryParameters,
          options: optionsAlternative ?? options());
      return result;
    } on DioException catch (e) {
      return e.response ??
          Response(statusCode: -1, requestOptions: RequestOptions());
    }
  }

  Future<Response> postData(
      {String? domainApp, required String path, dynamic params}) async {
    try {
      logRequest();
      Response<dynamic> result = await dio.post((domainApp ?? domain) + path,
          data: params, options: options());
      return result;
    } on DioException catch (e) {
      //print("Into errorExption? code: $params");
      return e.response ??
          Response(statusCode: -1, requestOptions: RequestOptions());
    }
  }

  Future<Response> postDataGraphql(
      {String? domainApp,
      required String path,
      String? query,
      Map<String, dynamic>? variables}) async {
    try {
      logRequest();
      Response<dynamic> result = await dio.post((domainApp ?? domain) + path,
          data: {"query": query, "variables": variables}, options: options());
      return result;
    } on DioException catch (e) {
      return e.response ??
          Response(statusCode: -1, requestOptions: RequestOptions());
    }
  }

  Future<Response> putData(
      {String? domainApp, required String path, dynamic params}) async {
    try {
      logRequest();
      Response<dynamic> result = await dio.put((domainApp ?? domain) + path,
          data: params, options: options());
      return result;
    } on DioException catch (e) {
      return e.response ??
          Response(statusCode: -1, requestOptions: RequestOptions());
    }
  }

  Future<Response> patchData(
      {String? domainApp,
      required String path,
      Map<String, dynamic>? params}) async {
    try {
      logRequest();
      Response<dynamic> result = await dio.patch((domainApp ?? domain) + path,
          data: params, options: options());
      return result;
    } on DioException catch (e) {
      return e.response ??
          Response(statusCode: -1, requestOptions: RequestOptions());
    }
  }

  Future<Response> deleteData(
      {String? domainApp,
      required String path,
      Map<String, dynamic>? params}) async {
    try {
      logRequest();

      Response<dynamic> result = await dio.delete((domainApp ?? domain) + path,
          data: params, options: options());
      return result;
    } on DioException catch (e) {
      return e.response ??
          Response(statusCode: -1, requestOptions: RequestOptions());
    }
  }

  Future<Response> uploadImage(String url, String fileUrl) async {
    try {
      logRequest();
      final binary = File(fileUrl).readAsBytesSync();
      return await dio.put(url,
          data: Stream.fromIterable(binary.map((e) => [e])),
          options: Options(
              headers: {'Content-Length': binary.length},
              followRedirects: false,
              validateStatus: (status) {
                return true;
              }));
    } on DioException catch (e) {
      return e.response ??
          Response(statusCode: -1, requestOptions: RequestOptions());
    }
  }

  Future<Response> uploadImagePost(String url, String fileUrl) async {
    try {
      logRequest();
      final response = await dio.post(url,
          data: FormData.fromMap({
            'file': [await MultipartFile.fromFile(fileUrl)],
          }),
          options: options());
      return response;
    } on DioException catch (e) {
      return e.response ??
          Response(statusCode: -1, requestOptions: RequestOptions());
    }
  }

  Future<Response> createPost(
      String url, Map<String, dynamic> mapDataForm) async {
    try {
      logRequest();
      final response = await dio.post(url,
          data: FormData.fromMap(mapDataForm), options: options());
      return response;
    } on DioException catch (e) {
      return e.response ??
          Response(statusCode: -1, requestOptions: RequestOptions());
    }
  }

  Future<Response> createComment(
      {required String url, required Map<String, dynamic> mapDataForm}) async {
    try {
      logRequest();
      final response = await dio.post(url,
          data: FormData.fromMap(mapDataForm), options: options());
      return response;
    } on DioException catch (e) {
      return e.response ??
          Response(statusCode: -1, requestOptions: RequestOptions());
    }
  }

  Future<Response> updateImage(
      {required String url, required Map<String, dynamic> mapDataForm}) async {
    try {
      logRequest();
      final response = await dio.put(url,
          data: FormData.fromMap(mapDataForm), options: options());
      return response;
    } on DioException catch (e) {
      return e.response ??
          Response(statusCode: -1, requestOptions: RequestOptions());
    }
  }

  Future<dynamic> getInvoiceDigital(String url) async {
    try {
      try {
        Response response = await Dio().get(
          url,
          options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              }),
        );
        return response.data;
      } catch (e) {
        print(e);
      }
    } on DioException catch (e) {
      return e.response ??
          Response(statusCode: -1, requestOptions: RequestOptions());
    }
  }

  Future download(String url, String savePath) async {
    try {
      try {
        Response response = await Dio().get(
          url,
          options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              }),
        );
        File file = File(savePath);
        print(file.path);
        var raf = file.openSync(mode: FileMode.write);
        raf.writeFromSync(response.data);
        await raf.close();
      } catch (e) {
        print(e);
      }
    } on DioException catch (e) {
      return e.response ??
          Response(statusCode: -1, requestOptions: RequestOptions());
    }
  }

  Future<Response> getDataMap(
      {String? domainApp,
      required String path,
      Map<String, dynamic>? queryParameters}) async {
    try {
      logRequest();
      Response<dynamic> result = await dio.get((domainApp ?? domain) + path,
          queryParameters: queryParameters);
      return result;
    } on DioException catch (e) {
      return e.response ??
          Response(statusCode: -1, requestOptions: RequestOptions());
    }
  }

  Future<Response> downloadFile({
    required String path,
    required dynamic params,
  }) async {
    try {
      logRequest();
      Response response = await dio.post((domain) + path,
          data: params,
          options: Options(
            headers: {'Authorization': token.isEmpty ? '' : ('Bearer $token')},
            responseType: ResponseType.bytes,
          ));
      return response;
    } on DioException catch (e) {
      return e.response ??
          Response(statusCode: -1, requestOptions: RequestOptions());
    }
  }
}
