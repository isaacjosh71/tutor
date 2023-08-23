import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutor/app_folders/profile/settings/bloc/events.dart';
import 'package:tutor/app_folders/profile/settings/bloc/states.dart';

class SettingBlocs extends Bloc<SettingEvents, SettingStates>{
  SettingBlocs():super(const SettingStates()){
    on<TriggerSettings>(_triggerSettings);
  }
  _triggerSettings(SettingEvents events, Emitter<SettingStates> emit){
    emit(const SettingStates());
  }
}