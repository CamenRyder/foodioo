import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Core/Theme/assets.gen.dart';
import '../../../../Core/theme/app_colors.dart';
import '../../../../repositories/blocs/create_post/create_post_bloc.dart';
import '../../../../repositories/blocs/create_post/create_post_event.dart';
import '../../../General/svg_gen_size_widget.dart';

class GetImageWidget extends StatelessWidget {
  const GetImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showModalBottomSheet(
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width),
          context: context,
          builder: (contextA) {
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
                    onTap: () async => _pickImage(context),
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
                      Navigator.pop(context);
                      _takePicture(context);
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

  Future<void> _pickImage(BuildContext context) async {
    Navigator.pop(context);
    final images = await ImagePicker().pickMultiImage();

    if (images.isEmpty) {
      return;
    }

    context.read<CreatePostBloc>().add(GetImageDevice(images: images));
  }

  Future<void> _takePicture(BuildContext context) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image == null) {
      return;
    }
    context.read<CreatePostBloc>().add(GetImageDevice(images: [image]));
  }
}
