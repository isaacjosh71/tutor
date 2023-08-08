
import 'package:tutor/Utilities/routers/routes.dart';
import 'package:tutor/Utilities/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Utilities/services/global.dart';

Future<void> main() async{
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [...AppPages.allBlocProviders(context)],
        child: ScreenUtilInit(builder:
            (context, child)=> MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(
                      color: AppColors.primaryText
                  ),
                  elevation: 0, backgroundColor: Colors.white
              )
          ),
          onGenerateRoute: AppPages.generalRouteSettings,
        ),)
    );
  }
}
