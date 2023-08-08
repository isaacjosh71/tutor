import 'package:tutor/auth/bloc/register_event.dart';
import 'package:tutor/auth/bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterState>{
  RegisterBloc(): super(RegisterState()){
    on<EmailEvent>((event, emit){
      emit(state.copyWith(email: event.email));
    });
    on<UserNameEvent>((event, emit){
      emit(state.copyWith(userName: event.userName));
    });
    on<RepassWordEvent>((event, emit){
      emit(state.copyWith(rePassword: event.rePassword));
    });
    on<PasswordEvent>((event, emit){
      emit(state.copyWith(password: event.password));
    });
  }
}