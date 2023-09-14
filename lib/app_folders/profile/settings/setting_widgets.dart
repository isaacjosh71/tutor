import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutor/Utilities/widget/global_text.dart';
import 'package:tutor/app_folders/application_dashboard/root_bloc/root_bloc.dart';
import 'package:tutor/app_folders/home/home_blocs/bloc.dart';
import 'package:tutor/app_folders/home/home_blocs/event.dart';
import '../../../Utilities/routers/names.dart';
import '../../../Utilities/services/global.dart';
import '../../../Utilities/values/constants.dart';
import '../../application_dashboard/root_bloc/root_event.dart';

AppBar buildSettingsAppBar(){
  return AppBar(
    title: Container(
      child: Container(
        child: reGlobalUsableText('Settings')
      )
    ),
  );
}

Widget logOutButton(BuildContext context){
  return GestureDetector(
    onTap: (){
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Confirm logout'),
          content: const Text('Confirm logout'),
          actions: [
            TextButton(onPressed: ()=>Navigator.of(context).pop(),
                child: const Text('Cancel')),
            TextButton(onPressed: (){
              context.read<RootBlocs>().add(const TriggerRootEvent(0));
              context.read<HomePageBlocs>().add(HomePageDots(0));
              Global.storageServices.remove(AppConsts.USER_TOKEN_KEY);
              Global.storageServices.remove(AppConsts.USER_PROFILE_KEY);
              Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGNIN, (route) => false);
            },
                child: const Text('Confirm')),

          ],
        );
      });
    },
    child: Container(
      height: 100.h,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage('assets/icons/Logout.png'))
      ),
    ),
  );
}