import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodioo/ui/screen/authorizator/login_authorizator_screen.dart';
import 'package:foodioo/ui/screen/authorizator/register_authorizator_screen.dart';
import 'package:foodioo/ui/screen/splash/splash_screen.dart';
import '../../ui/screen/bottom_tabbar/bottom_tabbar_screen.dart';
import 'routes_name.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map?;
    switch (settings.name) {
      case NavigatorNames.LOGIN:
        return MaterialPageRoute(
            builder: (_) => const LoginAuthorizatorScreen());
      case NavigatorNames.REGISTER:
        return MaterialPageRoute(
            builder: (_) => const RegisterAuthorizatorScreen());
      case NavigatorNames.SPLASH:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case NavigatorNames.APP_MAIN:
        return MaterialPageRoute(builder: (_) => const BottomTabbarScreen());

      // case NavigatorNames.LOGIN_WEB:
      //   return MaterialPageRoute(
      //       builder: (_) => const LoginWeb(), fullscreenDialog: true);
      // case NavigatorNames.TABBAR:
      //   return MaterialPageRoute(builder: (_) => const TabbarController());
      // case NavigatorNames.DETAIL_ROUTING:
      //   return MaterialPageRoute(
      //       builder: (_) => DetailRoutingScreen(
      //           routeStatus: args?['routeStatus'],
      //           userId: args?['userId'],
      //           teamSaleId: args?['teamSaleId'],
      //           currentRoute: args?['currentRoute']));
      // case NavigatorNames.DETAIL_ROUTING:
      //   return MaterialPageRoute(
      //       builder: (_) => DetailRoutingScreen(
      //           dateImplement: args?['dateImplement'],
      //           isStart: args?['isStart'],
      //           isRouteToday: args?['isRouteToday'],
      //           currentRoute: args?['currentRoute']));
      // case NavigatorNames.REQUEST_REPLACEMENT:
      //   return MaterialPageRoute(
      //       builder: (_) => RequestReplacementScreen(
      //             // model: args?['currentRoute'],
      //             salePlaningId: args?['salePlaningId'] ?? "0",
      //             routeId: args?['routeId'] ?? "0",
      //             implementDate: args?['implementDate'] ?? "0",
      //           ));
      // case NavigatorNames.SALE_LISTING_NORMAL:
      //   return MaterialPageRoute(
      //       builder: (_) => SaleListingNormalPage(
      //             saleListingIndex: args?['saleListingIndex'],
      //           ));
      // case NavigatorNames.SALE_LISTING_MAIN:
      //   return MaterialPageRoute(
      //       builder: (_) => SaleListingMain(
      //             saleListingIndex: args?['saleListingIndex'],
      //           ));
      // case NavigatorNames.SALE_LISTING_DELETE:
      //   return MaterialPageRoute(
      //       builder: (_) => SaleListingDeletePage(
      //             saleListingIndex: args?['saleListingIndex'],
      //           ));
      // case NavigatorNames.DETAIL_CUSTOMER:
      //   return MaterialPageRoute(
      //       builder: (_) => DetailCustomerScreen(
      //             customerId: args?['customerId'] ?? "",
      //             teamSaleId: args?['teamSaleId'] ?? "",
      //             storeName: args?['storeName'] ?? "",
      //             processStatus: args?['processStatus'] ?? "",
      //             typeView: args?['typeView'],
      //             salePlanningId: args?['salePlanningId'],
      //           ));
      // case NavigatorNames.SEPERATE_BILLS:
      //   return MaterialPageRoute(
      //       builder: (_) => SeperateBillsScreen(
      //             orderId: args?['orderId'],
      //             mainCustomerId: args?['mainCustomerId'],
      //             saleListingIndex: args?['saleListingIndex'],
      //             ordersIdParent: args?[
      //                 'ordersIdParent'], // lấy orderId cha (dùng để bắt đơn tách trùng)
      //             orderIdSeperated: args?[
      //                 'orderIdSeperated'], // lấy list danh sách đơn đã tách thành bảng kê thường trước đó
      //           ));
      // case NavigatorNames.PAY_SUMMARY:
      //   return MaterialPageRoute(
      //       builder: (_) => PaySummaryPage(
      //             params: args!['params'],
      //           ));
      // case NavigatorNames.PURCHASE_MATERIAL:
      //   return MaterialPageRoute(
      //       builder: (_) => PurchaseMaterialPage(
      //             params: args?['params'],
      //           ));
      // case NavigatorNames.SEARCH_ROUTES:
      //   return MaterialPageRoute(
      //       builder: (_) => const SearchRouteBrowsedScreen());
      // case NavigatorNames.LIST_ROUTE:
      //   return MaterialPageRoute(builder: (_) => const ListRoutesScreen());
      // case NavigatorNames.FILLTER_ROUTE:
      //   return MaterialPageRoute(
      //       builder: (_) => FillterRoutePage(
      //             status: args?['status'],
      //             teamId: args?['teamId'],
      //           ));
      // case NavigatorNames.LIST_CUSTOMER:
      //   return MaterialPageRoute(
      //       builder: (_) => ListCustomer(
      //             inSite: args?['inSite'] ??
      //                 false, // khách trong nhà thì true, còn khách ngoài đướng sẽ falsse
      //           ));
      // case NavigatorNames.LIST_PRODUCT:
      //   return MaterialPageRoute(builder: (_) => const ListProduct());
      // case NavigatorNames.PRODUCT_DETAIL:
      //   return MaterialPageRoute(
      //       builder: (_) => ProductDetail(
      //             productId: args?['productId'],
      //             isGetBySloc: args?['isGetBySloc'] ??
      //                 false, // true là danh sách sản phẩm theo sloc, false là danh sách sản phẩm.
      //             type: args?['type'],
      //           ));
      // case NavigatorNames.CREATE_CUSTOMER:
      //   return MaterialPageRoute(builder: (_) => CreateCustomer(
      //     customerIdUpdate: args?['customerIdUpdate'],
      //   ));
      // case NavigatorNames.SEARCH_CUSTOMER:
      //   return MaterialPageRoute(
      //       builder: (_) => SearchCustomer(
      //             inSite: args?['inSite'] ??
      //                 false, // khách trong nhà thì true, còn khách ngoài đướng sẽ falsse
      //           ));
      // case NavigatorNames.SEPERATED_BILLS:
      //   return MaterialPageRoute(
      //       builder: (_) => SeperatedBillsScreen(
      //             saleListingIndex: args?['saleListingIndex'],
      //             subOrderIds: args?['subOrderIds'],
      //             isIntoFromListSale: args?['isIntoFromListSale'] ??
      //                 false, //nếu có biến này sẽ biết được xem bản kê từ item đã tách bảng kê qua
      //           ));
      // case NavigatorNames.SALE_HISTORY:
      //   return MaterialPageRoute(
      //     builder: (_) => const SaleHistorty(),
      //   );
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
