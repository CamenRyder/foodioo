import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Core/Theme/assets.gen.dart';
import '../../../../Core/theme/app_colors.dart';
import '../../../General/svg_gen_size_widget.dart';

class GetImageWidget extends StatelessWidget {
  const GetImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // await showModalBottomSheet(
        //   context: context,
        //   builder: (context) => Container(),
        // );
        showModalBottomSheet(
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width),
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.photo_library,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      'Lấy ảnh từ thư viện',
                      style: Theme.of(context).textTheme.bodyLarge,
                      // style: TextStyle(
                      //     color: AppColors.secondary, fontSize: 14),
                    ),
                    onTap: () {
                      // Navigator.pop(context);
                      _pickImage();
                    },
                  ),
                  const Divider(
                    height: 1,
                    color: AppColors.grey,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.camera_alt,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      'Chụp ảnh',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    onTap: () {
                      // Navigator.pop(context);
                      _takePicture();
                    },
                  ),
                ],
              ),
            );
          },
        );
        // final a = await ImagePicker().pickMultiImage();
      },
      child: SvgGenSizeWidget(
        icon: Assets.icons.imagePicker.svg(),
        isLargeSize: true,
      ),
    );
  }

  Future<void> _pickImage() async {
    final image = await ImagePicker().pickMultiImage();

    if (image == null) {
      return;
    }
    // setState(() {
    //   widget.listImage.addAll(image);
    // });
  }

  Future<void> _takePicture() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image == null) {
      return;
    }
    // setState(() {
    //   widget.listImage.addAll([image]);
    // });
  }
}
