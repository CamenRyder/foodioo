import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/profile/profile_bloc.dart';
import 'package:foodioo/repositories/blocs/profile/profile_state.dart';
import 'package:foodioo/repositories/models/friend_status_model.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../repositories/blocs/profile/profile_event.dart';
import '../../../General/dialog_confirm_widget.dart';

class MethodInteractButtonWidget extends StatelessWidget {
  const MethodInteractButtonWidget({
    super.key,
    this.typeFollower,
    this.bloc,
  });
  final ProfileBloc? bloc;
  final TypeFollwer? typeFollower;
  @override
  Widget build(BuildContext context) {
    bool isShowRemoveFriend = typeFollower == TypeFollwer.friend;
    bool isShowRemoveRequested = typeFollower == TypeFollwer.request;
    bool isShowAccept = typeFollower == TypeFollwer.accept;

    String titleMethodButton = isShowAccept
        ? "Chấp nhận lời mời"
        : isShowRemoveRequested
            ? "Hủy yêu cầu"
            : isShowRemoveFriend
                ? "Hủy bạn bè"
                : "Kết bạn ";

    return Row(
      children: [
        // typeFollwerCurrentAccountWithViaAccount
        const Expanded(child: SizedBox()),
        GestureDetector(
          onTap: () async {
            handleData(
                typeFollewer: typeFollower!, bloc: bloc!, context: context);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor),
            margin: const EdgeInsets.symmetric(
                vertical: AppConstant.paddingContent,
                horizontal: AppConstant.paddingHorizontalApp),
            padding: const EdgeInsets.symmetric(
                vertical: AppConstant.paddingContent + 5,
                horizontal: AppConstant.paddingHorizontalApp + 5),
            child: Text(
              titleMethodButton,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  handleData(
      {required TypeFollwer typeFollewer,
      required ProfileBloc bloc,
      required BuildContext context}) async {
    bool isShowRemoveFriend = typeFollower == TypeFollwer.friend;
    bool isShowRemoveRequested = typeFollower == TypeFollwer.request;
    bool isShowAccept = typeFollower == TypeFollwer.accept;
    // String titleMethodButton = isShowAccept
    //     ? "Chấp nhận lời mời"
    //     : isShowRemoveRequested
    //         ? "Hủy yêu cầu"
    //         : isShowRemoveFriend
    //             ? "Xóa bạn bè"
    //             : "Kết bạn ";

    if (isShowAccept) {
      await showDialog(
          context: context,
          builder: (context) {
            return BlocBuilder<ProfileBloc, ProfileState>(
                bloc: bloc,
                buildWhen: (previous, current) =>
                    current.isLoadingRequestFriends !=
                        previous.isLoadingRequestFriends ||
                    current.isPopDialog == true,
                builder: (context, state) {
                  if (state.isPopDialog) {
                    Navigator.pop(context);
                  }
                  if (state.isLoadingRequestFriends) {
                    return DialogConfirm(
                      content: "Chắc chắn muốn thực hiện việc này ?",
                      textConfirm: "Ok",
                      textCancel: "Trở lại",
                      isLoading: true,
                      func: () {
                        // Navigator.pop(context);
                      },
                      fucCancel: () {
                        Navigator.pop(context);
                      },
                    );
                  }
                  return DialogConfirm(
                    content: "Chắc chắn muốn thực hiện việc này ?",
                      textConfirm: "Ok",
                      textCancel: "Trở lại",
                    func: () {
                      bloc.add(AcceptFollower(
                          followerAccountId: bloc.state.viaAccountId));
                    },
                    fucCancel: () {
                      Navigator.pop(context);
                    },
                  );
                });
          });
    } else if (isShowRemoveRequested) {
      await showDialog(
          context: context,
          builder: (context) {
            return BlocBuilder<ProfileBloc, ProfileState>(
                bloc: bloc,
                buildWhen: (previous, current) =>
                    current.isLoadingRequestFriends !=
                        previous.isLoadingRequestFriends ||
                    current.isPopDialog == true,
                builder: (context, state) {
                  if (state.isPopDialog) {
                    Navigator.pop(context);
                  }
                  if (state.isLoadingRequestFriends) {
                    return DialogConfirm(
                      content: "Chắc chắn muốn thực hiện việc này ?",
                      textConfirm: "Ok",
                      textCancel: "Trở lại",
                      isLoading: true,
                      func: () {
                        // Navigator.pop(context);
                      },
                      fucCancel: () {
                        Navigator.pop(context);
                      },
                    );
                  }
                  return DialogConfirm(
                     content: "Chắc chắn muốn thực hiện việc này ?",
                      textConfirm: "Ok",
                      textCancel: "Trở lại",
                    func: () {
                      bloc.add(RemoveFriend(
                          friendAccountId: bloc.state.viaAccountId));
                    },
                    fucCancel: () {
                      Navigator.pop(context);
                    },
                  );
                });
          });
    } else if (isShowRemoveFriend) {
      await showDialog(
          context: context,
          builder: (context) {
            return BlocBuilder<ProfileBloc, ProfileState>(
                bloc: bloc,
                buildWhen: (previous, current) =>
                    current.isLoadingRequestFriends !=
                        previous.isLoadingRequestFriends ||
                    current.isPopDialog == true,
                builder: (context, state) {
                  if (state.isPopDialog) {
                    Navigator.pop(context);
                  }
                  if (state.isLoadingRequestFriends) {
                    return DialogConfirm(
                      content: "Chắc chắn muốn thực hiện việc này ?",
                      textConfirm: "Ok",
                      textCancel: "Trở lại",
                      isLoading: true,
                      func: () {
                        // Navigator.pop(context);
                      },
                      fucCancel: () {
                        Navigator.pop(context);
                      },
                    );
                  }
                  return DialogConfirm(
                 content: "Chắc chắn muốn thực hiện việc này ?",
                      textConfirm: "Ok",
                      textCancel: "Trở lại",
                    func: () {
                      bloc.add(RemoveFriend(
                          friendAccountId: bloc.state.viaAccountId));
                    },
                    fucCancel: () {
                      Navigator.pop(context);
                    },
                  );
                });
          });
    } else {
      await showDialog(
          context: context,
          builder: (context) {
            return BlocBuilder<ProfileBloc, ProfileState>(
                bloc: bloc,
                buildWhen: (previous, current) =>
                    current.isLoadingRequestFriends !=
                        previous.isLoadingRequestFriends ||
                    current.isPopDialog == true,
                builder: (context, state) {
                  if (state.isPopDialog) {
                    Navigator.pop(context);
                  }
                  if (state.isLoadingRequestFriends) {
                    return DialogConfirm(
                      content: "Chắc chắn muốn thực hiện việc này ?",
                      textConfirm: "Ok",
                      textCancel: "Trở lại",
                      isLoading: true,
                      func: () {
                        // Navigator.pop(context);
                      },
                      fucCancel: () {
                        Navigator.pop(context);
                      },
                    );
                  }
                  return DialogConfirm(
                   content: "Chắc chắn muốn thực hiện việc này ?",
                      textConfirm: "Ok",
                      textCancel: "Trở lại",
                    func: () {
                      bloc.add(
                          FollowAccount(accountId: bloc.state.viaAccountId));
                    },
                    fucCancel: () {
                      Navigator.pop(context);
                    },
                  );
                });
          });
    }
  }
}
