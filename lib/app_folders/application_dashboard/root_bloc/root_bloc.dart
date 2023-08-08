import 'package:tutor/app_folders/application_dashboard/root_bloc/root_event.dart';
import 'package:tutor/app_folders/application_dashboard/root_bloc/root_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootBlocs extends Bloc<RootEvents, RootStates>{
  RootBlocs():super(const RootStates()){
    on<TriggerRootEvent>((event, emit){
      emit(RootStates(index: state.index));
    });
  }
}