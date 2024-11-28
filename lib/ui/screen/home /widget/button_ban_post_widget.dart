import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/repositories/blocs/home/home_bloc.dart';
import 'package:foodioo/repositories/blocs/home/home_state.dart';
import 'package:foodioo/repositories/models/report_model.dart';
import 'package:foodioo/ui/General/spacing_vertical_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../Core/Theme/assets.gen.dart';
import '../../../../repositories/blocs/home/home_event.dart';
import '../../../General/customize_button_widget.dart';
import '../../../General/message_over_screen.dart';
import '../../../General/svg_gen_size_widget.dart';
import 'check_box_report_widget.dart';

class ButtonBanPostWidget extends StatelessWidget {
  const ButtonBanPostWidget({super.key, required this.postId});
  final int postId;
  final radius = const Radius.circular(AppConstant.radiusExtra);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showModalBottomSheet(
          context: context,
          builder: (context) {
            final heightBottomSheet = MediaQuery.of(context).size.height / 1.5;
            final widthBottomSheet = MediaQuery.of(context).size.width;
            context.read<HomeBloc>().add(FetchYourReport(postId: postId));
            return Container(
              height: heightBottomSheet,
              padding: const EdgeInsets.all(AppConstant.paddingComponent + 5),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius:
                      BorderRadius.only(topLeft: radius, topRight: radius)),
              child: Column(
                children: [
                  Container(
                    height: widthBottomSheet / 100,
                    width: widthBottomSheet / 8,
                    margin:
                        EdgeInsets.symmetric(vertical: widthBottomSheet / 20),
                    decoration: BoxDecoration(
                        color: Theme.of(context).hintColor,
                        borderRadius:
                            BorderRadius.circular(AppConstant.radiusExtra)),
                  ),
                  Center(
                    child: Text(
                      "Tố cáo bài viết",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  SpacingVerticalWidget(
                    height: widthBottomSheet / 22,
                  ),
                  Expanded(
                    child: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state.isLoadingYourReportIntoPost) {
                          return Skeletonizer(
                            child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) =>
                                  const CheckBoxReportWidget(),
                            ),
                          );
                        }
                        final listPicked = state.issuesTicked;
                        return ListView.builder(
                            itemCount: state.issuesDefault.length,
                            itemBuilder: (context, index) {
                              bool isTicked = false;
                              // isTicked =
                              listPicked.forEach((element) {
                                if (element.id ==
                                    state.issuesDefault[index].id) {
                                  isTicked = true;
                                }
                              });
                              return CheckBoxReportWidget(
                                model: state.issuesDefault[index],
                                isTicked: isTicked,
                              );
                            });
                      },
                    ),
                  ),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state.isLoadingPostReport) {
                        return Center(
                            child: SpinKitThreeBounce(
                          color: Theme.of(context).primaryColor,
                          size: AppConstant.sizeIconMedium,
                        ));
                      }
                      if (state.isPostedReport) {
                        MessageToast.showToast(context,
                            message: "Đã báo cáo bài viết");
                        Navigator.pop(context);
                      }
                      return CustomizeButtonWidget(
                        onPressed: () {
                          context
                              .read<HomeBloc>()
                              .add(MultiPickReport(postId: postId));
                        },
                        title: "Cập nhật",
                        isEnable: true,
                      );
                    },
                  )
                ],
              ),
            );
          },
        );
      },
      child: SvgGenSizeWidget(
          icon: Assets.icons.ban.svg(color: Theme.of(context).hintColor)),
    );
  }
}
