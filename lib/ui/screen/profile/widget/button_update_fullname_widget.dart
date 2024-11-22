import 'package:flutter/material.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../Core/Theme/app_typography.dart';
import '../../../../Core/Theme/assets.gen.dart';
import '../../../General/customize_button_widget.dart';
import '../../../General/message_over_screen.dart';
import '../../../General/spacing_vertical_widget.dart';
import '../../../General/svg_gen_size_widget.dart';

class ButtonUpdateFullnameWidget extends StatelessWidget {
  const ButtonUpdateFullnameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final heightScreen =  MediaQuery.sizeOf(context).height;  
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
          builder: (context) => Container(
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
                    // context.read<ProfileBloc>().add(
                    //     InputDescriptionToUploadPost(
                    //         description: value));
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
                CustomizeButtonWidget(
                  onPressed: () {
                    MessageToast.showToast(context);
                  },
                  title: "Cập nhật",
                  isEnable: true,
                ),
              ])),
        );
        // Navigator.pushNamed(
        //     context, NavigatorNames.UPDATE_ACCOUNT);
      },
    );
  }
}
