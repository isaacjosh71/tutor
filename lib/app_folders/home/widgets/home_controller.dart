import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutor/Utilities/entities/entities.dart';
import 'package:tutor/Utilities/repositories/course_repo.dart';
import 'package:tutor/app_folders/home/home_blocs/bloc.dart';
import 'package:tutor/app_folders/home/home_blocs/event.dart';

import '../../../Utilities/services/global.dart';

class HomeController{
  final BuildContext context;
  HomeController({required this.context});
  UserItem? getUserProfile  = Global.storageServices.getUserProfile();

  Future<void> init()async{
    if(Global.storageServices.getUserToken().isNotEmpty){
      var result = await CourseAPI.courseList();
      if(result.code==200){

        if(context.mounted){
          context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
        }

        print(result.data![1].description);
      }else{
        print(result.code);
      }
    }else{
      print('User already logged out');
    }
  }
}