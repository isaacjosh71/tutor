import 'package:tutor/Utilities/values/colors.dart';
import 'package:tutor/app_folders/application_dashboard/root_bloc/root_bloc.dart';
import 'package:tutor/app_folders/application_dashboard/root_bloc/root_event.dart';
import 'package:tutor/app_folders/application_dashboard/root_bloc/root_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dashboard_widget.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootBlocs, RootStates>(builder: (context, state){
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            body: buildPage(state.index),
            bottomNavigationBar: Container(
              width: 375.w, height: 53.h,
              decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1, blurRadius: 1
                    )
                  ]
              ),
              child: BottomNavigationBar(
                  currentIndex: state.index,
                  onTap: (value){
                    context.read<RootBlocs>().add(TriggerRootEvent(value));
                  },
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: AppColors.primaryElement,
                  unselectedItemColor: AppColors.primaryFourElementText,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: bottomTabs),
            ),
          ),
        ),
      );
    });
  }
}
