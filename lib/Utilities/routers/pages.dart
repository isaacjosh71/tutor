//unify blocProvider, routes and pages
import 'package:tutor/auth/bloc/register_bloc.dart';
import 'package:tutor/auth/bloc/sign_in_bloc.dart';
import 'package:tutor/auth/register.dart';
import 'package:tutor/auth/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app_folders/application_dashboard/root_bloc/root_bloc.dart';
import '../../app_folders/application_dashboard/root_page.dart';
import '../../app_folders/onboarding/bloc/onboarding_blocs.dart';
import '../../app_folders/onboarding/onboarding_screen.dart';
import '../services/global.dart';
import 'names.dart';

class PageEntity{
  String routes;
  Widget pages;
  dynamic bloc;
  PageEntity({required this.routes, required this.pages, this.bloc});
}

class AppPages{
  static List<PageEntity> routes(){
    return [
      PageEntity(routes: AppRoutes.INITIAL,
        pages: const OnBoarding(),
        bloc: BlocProvider(create: (_)=> OnBoardingBlocs(),),),
      PageEntity(routes: AppRoutes.SIGNIN,
        pages: const SignIn(),
        bloc: BlocProvider(create: (_)=> SignInBloc(),),),
      PageEntity(routes: AppRoutes.REGISTER,
        pages: const Register(),
        bloc: BlocProvider(create: (_)=> RegisterBloc(),),),
      PageEntity(routes: AppRoutes.ROOTPAGE,
        pages: const RootPage(),
        bloc: BlocProvider(create: (_)=> RootBlocs(),),

      ),
    ];
  }

//return all bloc provider
  static List<dynamic> allBlocProviders(BuildContext context){
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()){
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  //a method that covers entire screen as we click on navigator object
  static MaterialPageRoute generalRouteSettings(RouteSettings settings){
    if(settings.name!=null){
      //check for route name matching when navigation gets triggered
      var results =routes().where((element) => element.routes==settings.name);
      if(results.isNotEmpty){
        bool deviceFirstOpen = Global.storageServices.getDeviceFirstOpen();
        if(results.first.routes==AppRoutes.INITIAL&&deviceFirstOpen){
          bool isLoggedIn= Global.storageServices.getIsLoggedIn();
          if(isLoggedIn){
            return MaterialPageRoute(builder: (_)=>const RootPage(), settings: settings);
          }
          return MaterialPageRoute(builder: (_)=>const SignIn(), settings: settings);
        }
        return MaterialPageRoute(builder: (_)=>results.first.pages, settings: settings);
      }
    }
    print('invalid route name ${settings.name}');
    return MaterialPageRoute(builder: (_)=>const SignIn(), settings: settings);
  }
}



