import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodioo/repositories/authentication/auth_bloc.dart';
import 'package:foodioo/repositories/blocs/profile/profile_state.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../Core/Theme/app_typography.dart';
import '../../../../Core/Theme/assets.gen.dart';
import '../../../../repositories/blocs/profile/profile_bloc.dart';
import '../../../../repositories/blocs/profile/profile_event.dart';
import '../../../General/customize_button_widget.dart';
import '../../../General/spacing_vertical_widget.dart';
import '../../../General/svg_gen_size_widget.dart';

class ButtonUpdateFullnameWidget extends StatelessWidget {
  const ButtonUpdateFullnameWidget({
    super.key,
    required this.bloc,
  });
  final ProfileBloc bloc;

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.sizeOf(context).height;
    return ListTile(
      leading: SvgGenSizeWidget(
        icon: Assets.icons.identification
            .svg(color: Theme.of(context).primaryColor),
      ),
      title: Text('Cập nhập tên hiển thị',
          style: Theme.of(context).textTheme.bodyLarge),
      onTap: () async {
        Navigator.pop(context);
        await showModalBottomSheet(
          context: context,
          builder: (contexta) => Container(
              height: heightScreen * 0.8,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Center(
                  child: Text(
                    "Cập nhật tên hiển thị",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SpacingVerticalWidget(
                  height: 35,
                ),
                TextField(
                  maxLines: 1,
                  // controller: controller,
                  onChanged: (value) {
                    bloc.add(InputFullName(updateName: value));
                  },
                  style: Theme.of(context).textTheme.bodyLarge, // displaySmall
                  decoration: const InputDecoration(
                    hintText: "Nhập tên hiển thị",
                    filled: true,
                    hintStyle: AppTypographyLight.textHintBold,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: AppConstant.paddingVerticalApp,
                        horizontal: AppConstant.paddingVerticalApp),
                    labelStyle: AppTypographyLight.textContentBold,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Color.fromARGB(255, 234, 234, 234),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(AppConstant.radiusExtra)),
                        borderSide: BorderSide.none),
                  ),
                ),
                const Expanded(child: SizedBox()),
                BlocBuilder<ProfileBloc, ProfileState>(
                  bloc: bloc,
                  // buildWhen: (previous, current) =>
                  //     previous.isLoadingUpdate != current.isLoadingUpdate ||
                  //     current.isUpdateSuccess == true,
                  builder: (context, state) {
                    if (state.isUpdateSuccess == true) {
                      // onCallBackRefreshAccout();
                      Navigator.pop(context);
                    }
                    if (state.isLoadingUpdate) {
                      return Center(
                          child: SpinKitThreeBounce(
                        color: Theme.of(context).primaryColor,
                        size: AppConstant.sizeIconMedium,
                      ));
                    }
                    return CustomizeButtonWidget(
                      onPressed: () {
                        // MessageToast.showToast(context);
                        bloc.add(ChangeFullName());
                        // Navigator.pop(context);
                      },
                      title: "Cập nhật",
                      isEnable: true,
                    );
                  },
                )
              ])),
        );

        // Navigator.pushNamed(
        //     context, NavigatorNames.UPDATE_ACCOUNT);
      },
    );
  }
}
