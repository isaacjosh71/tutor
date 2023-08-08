import 'package:tutor/auth/bloc/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../app_folders/onboarding/bloc/onboarding_blocs.dart';
import '../auth/bloc/sign_in_bloc.dart';

class AppBlocProviders{
  static get allBlockProviders=>[
    BlocProvider(lazy: false, create: (context)=> OnBoardingBlocs(),),
    BlocProvider(create: (context)=> SignInBloc(),),
    BlocProvider(create: (context)=> RegisterBloc(),),
  ];
}