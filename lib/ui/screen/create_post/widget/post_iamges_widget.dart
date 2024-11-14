import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../repositories/blocs/create_post/create_post_bloc.dart';
import '../../../../repositories/blocs/create_post/create_post_event.dart';
import '../../../../repositories/blocs/create_post/create_post_state.dart';

class PostIamgesWidget extends StatelessWidget {
  const PostIamgesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: BlocBuilder<CreatePostBloc, CreatePostState>(
      buildWhen: (previous, current) {
        return current.images != previous.images;
      },
      builder: (context, state) {
        if (state.images.isNotEmpty) {
          return ListView.builder(
            itemCount: state.images.length,
            itemBuilder: (context, index) {
              return Container(
                  padding: const EdgeInsets.all(AppConstant.paddingComponent),
                  child: Stack(
                    children: [
                      Image.file(
                        File(state.images[index].path),
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            context
                                .read<CreatePostBloc>()
                                .add(RemoveImage(index: index));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(
                                AppConstant.paddingComponent),
                            padding: const EdgeInsets.all(
                                AppConstant.paddingContent),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(134, 15, 15, 15)),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ));
            },
          );
        }
        return const SizedBox();
      },
    ));
  }
}
