import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutor/app_folders/home/home_blocs/event.dart';
import 'package:tutor/app_folders/home/home_blocs/state.dart';

class HomePageBlocs extends Bloc<HomePageEvents, HomePageStates>{
  HomePageBlocs():super(const HomePageStates()){
    on<HomePageDots>(_homePageDots);
  }

  void _homePageDots(HomePageDots events, Emitter<HomePageStates> emit){
    emit(state.copyWith(index: events.index));
  }
}