import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutor/Utilities/values/colors.dart';
import 'package:tutor/app_folders/home/home_blocs/bloc.dart';
import 'package:tutor/app_folders/home/home_blocs/state.dart';
import 'package:tutor/app_folders/home/widgets/home_controller.dart';
import 'package:tutor/app_folders/home/widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late HomeController _homeController;

  @override
  void initState(){
    super.initState();
    _homeController = HomeController(context: context);
    _homeController.init();
  }

  @override
  Widget build(BuildContext context) {
    return _homeController.getUserProfile!=null
        ? Scaffold(
        backgroundColor: Colors.white,
        appBar: buildHomeAppBar(_homeController.getUserProfile!.avatar.toString()),
        body: BlocBuilder<HomePageBlocs, HomePageStates>(builder: (context, state){
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: homePageText(
                      'Hello,',
                      color: AppColors.primaryThreeElementText,
                      top: 20
                  ),
                ),
                SliverToBoxAdapter(
                  child: homePageText(
                      _homeController.getUserProfile!.name!,
                      color: AppColors.primaryText,
                      top: 5
                  ),
                ),
                SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                SliverToBoxAdapter(child: searchView(),),
                SliverToBoxAdapter(child: slideView(context, state),),
                SliverToBoxAdapter(child: menuView()),
                SliverPadding(padding: EdgeInsets.symmetric(
                    vertical: 20.h, horizontal: 0
                ),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: 15.h,
                        crossAxisSpacing: 15.w, childAspectRatio: 1.5),
                    delegate: SliverChildBuilderDelegate(
                        childCount: 4,
                            (BuildContext context, int index){
                          return GestureDetector(
                            onTap: (){},
                            child: courseGrid(),
                          );
                        }
                    ),
                  ),
                ),
              ],
            ),
          );
        })
    ) : Container();
  }
}
