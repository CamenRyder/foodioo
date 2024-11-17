import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/Core/Helper/helper_function.dart';
import 'package:foodioo/repositories/blocs/comment/comment_bloc.dart';
import 'package:foodioo/repositories/blocs/comment/comment_state.dart';
import 'package:foodioo/ui/General/svg_gen_size_widget.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../Core/Theme/app_colors.dart';
import '../../../../Core/Theme/assets.gen.dart';
import '../../../../repositories/blocs/comment/comment_event.dart';

class TextfieldCommentsWidget extends StatelessWidget {
   TextfieldCommentsWidget({super.key});
 final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      BlocBuilder<CommentBloc, CommentState>(
          buildWhen: (previous, current) =>
              previous.urlImages != current.urlImages ,
          builder: (context, state) {
            if (state.urlImages.isEmpty) {
              controller.clear();
              return const SizedBox();
            }
            return Row(
              children: [
                SizedBox(
                  height: 65,
                  width: 65,
                  child: Image.asset(state.urlImages),
                ),
                IconButton(
                    onPressed: () {
                      context.read<CommentBloc>().add(RemoveImage());
                    },
                    icon: const Icon(Icons.close)),
              ],
            );
          }),
      Row(
        children: [
          IconButton(
            icon: SvgGenSizeWidget(icon: Assets.icons.imagePicker.svg()),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              removeFocus(context);
              showModalBottomSheet(
                constraints:
                    BoxConstraints(minWidth: MediaQuery.of(context).size.width),
                context: context,
                builder: (contextA) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
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
            },
          ),
          Expanded(
            child: TextField(
              controller: controller ,
              onChanged: (value) => {
                context
                    .read<CommentBloc>()
                    .add(InputDescription(description: value))
              },
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: AppConstant.textSizeContent),
              decoration: InputDecoration(
                hintText: 'Viết bình luận của bạn',
                hintStyle: TextStyle(color: Colors.grey[600]),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppConstant.paddingHorizontalApp,
                    vertical: AppConstant.paddingComponent),
              ),
            ),
          ),
          BlocBuilder<CommentBloc, CommentState>(
              buildWhen: (previous, current) =>
                  previous.description != current.description,
              builder: (context, state) {
                return IconButton(
                  icon: Icon(Icons.send,
                      color: state.description.isEmpty
                          ? Colors.grey[600]
                          : Theme.of(context).primaryColor),
                  onPressed: () {
                    if (state.description.isNotEmpty) {
                      context.read<CommentBloc>().add(PostComments());
                    }
                  },
                );
              }),
        ],
      ),
    ]);
  }

  Future<void> _pickImage(BuildContext context) async {
    Navigator.pop(context);
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) {
      return;
    }

    context.read<CommentBloc>().add(GetImageFormGalary(file: image));
  }

  Future<void> _takePicture(BuildContext context) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image == null) {
      return;
    }
    context.read<CommentBloc>().add(GetImageFormGalary(file: image));
  }
}
