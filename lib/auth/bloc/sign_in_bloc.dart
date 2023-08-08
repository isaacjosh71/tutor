import 'package:tutor/auth/bloc/sign_in_events.dart';
import 'package:tutor/auth/bloc/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvents, SignInState>{
  SignInBloc(): super(SignInState()){
    on<EmailEvents>((event, emit){
      emit(state.copyWith(email: event.email));
      print(event.email);
    });
    on<PasswordEvents>((event, emit){
      emit(state.copyWith(password: event.password));
    });
  }

  // void _emailEvent(EmailEvents events, Emitter<SignInState>emit){
  //   emit(state.copyWith(email: events.email));
  // }
}