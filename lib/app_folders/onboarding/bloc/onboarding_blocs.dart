
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app_folders/onboarding/bloc/onboarding_events.dart';
import '../../../app_folders/onboarding/bloc/onboarding_states.dart';

class OnBoardingBlocs extends Bloc<OnBoardingEvents, OnBoardingState>{
OnBoardingBlocs(): super(OnBoardingState()){
  on<OnBoardingEvents>((event, emit){
    emit(OnBoardingState(page:state.page));
  });
}
}