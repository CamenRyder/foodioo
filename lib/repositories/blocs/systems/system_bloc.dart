import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/systems/system_event.dart';
import 'package:foodioo/repositories/blocs/systems/system_state.dart';

class SystemBloc extends Bloc<SystemEvent, SystemState> {
  SystemBloc()
      : super(SystemState(
          scrollController: ScrollController(),
          pageController: PageController(),
        )) {
    on<InitialSystem>((event, emit) => _onInitialSystem(event, emit));
    on<ShowBottomNavBar>((event, emit) => _onShowBottomNavBar(event, emit));
    on<OffBottomNavBar>((event, emit) => _onOffBottomNavBar(event, emit));
    on<ShowAppBar>((event, emit) => _onShowAppBar(event, emit));
    on<OffAppBar>((event, emit) => _onOffAppBar(event, emit));
  }

  _onShowBottomNavBar(ShowBottomNavBar event, Emitter emit) {
    emit(state.copyWith(isShowBottomNavBar: true));
  }

  _onOffBottomNavBar(OffBottomNavBar event, Emitter emit) {
    emit(state.copyWith(isShowBottomNavBar: false));
  }

  _onShowAppBar(ShowAppBar event, Emitter emit) {
    emit(state.copyWith(isShowAppBar: true));
  }

  _onOffAppBar(OffAppBar event, Emitter emit) {
    emit(state.copyWith(isShowAppBar: false));
  }

  _onInitialSystem(InitialSystem event, Emitter emit) {
    ScrollController controller = ScrollController();

    double oldOffset = 0.0;
    controller.addListener(() {
      if (controller.offset > 100) {
        if (controller.offset > oldOffset) {
          add(OffBottomNavBar());
          add(OffAppBar());
        } else {
          add(ShowBottomNavBar());
          add(ShowAppBar());
        }
      }
      oldOffset = controller.offset;
    });
    emit(state.copyWith(scrollController: controller));
  }
}
