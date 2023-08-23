import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutor/app_folders/profile/settings/bloc/blocs.dart';
import 'package:tutor/app_folders/profile/settings/bloc/states.dart';

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
      body: SingleChildScrollView(
        child: BlocBuilder<SettingBlocs, SettingStates>(builder: (context, state){
          return Container(
            child: Column(
              children: [

              ],
            ),
          );
        }),
      ),
    );
  }
}
