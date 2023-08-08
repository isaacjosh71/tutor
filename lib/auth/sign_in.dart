import 'package:tutor/auth/bloc/sign_in_bloc.dart';
import 'package:tutor/auth/bloc/sign_in_controller.dart';
import 'package:tutor/auth/bloc/sign_in_events.dart';
import 'package:tutor/auth/bloc/sign_in_state.dart';
import 'package:tutor/auth/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state){
      return Container(
        color: Colors.white,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLogin(context),
                Center(child: reUsableText('Or use your email account to login')),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reUsableText('Email'),
                      SizedBox(height: 10.h,),
                      buildTextField('Enter email', 'email', 'user',
                          (value){
                        context.read<SignInBloc>().add(EmailEvents(value));
                          }
                      ),
                      reUsableText('Password'),
                      SizedBox(height: 10.h,),
                      buildTextField('Enter password', 'password', 'lock',
                              (value){
                            context.read<SignInBloc>().add(PasswordEvents(value));
                          }
                      ),
                    ],
                  ),
                ),
                forgotPassword(),
                buildLogInAndRegButton('Log In', 'login', (){
                  SignInController(context: context).handleSignIn('email');
                }),
                buildLogInAndRegButton('Sign Up', 'register', (){
                  Navigator.of(context).pushNamed('/register');
                })
              ],
            ),
          ),
        ),
      );
    });
  }
}
