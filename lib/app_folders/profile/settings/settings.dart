import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutor/Utilities/routers/routes.dart';
import 'package:tutor/Utilities/services/global.dart';
import 'package:tutor/Utilities/values/constants.dart';
import 'package:tutor/app_folders/profile/settings/bloc/blocs.dart';
import 'package:tutor/app_folders/profile/settings/bloc/states.dart';
import 'package:tutor/app_folders/profile/settings/setting_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildSettingsAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingBlocs, SettingStates>(builder: (context, state){
          return Container(
            child: Column(
              children: [
                logOutButton(context)
              ],
            ),
          );
        }),
      ),
    );
  }
}
