import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/repositories/blocs/systems/system_event.dart';
import 'package:foodioo/repositories/blocs/systems/system_state.dart';

class SystemBloc extends Bloc<SystemState, SystemEvent> {
  SystemBloc(super.initialState);
  
}