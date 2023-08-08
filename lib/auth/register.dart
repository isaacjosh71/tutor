import 'package:tutor/auth/bloc/register_bloc.dart';
import 'package:tutor/auth/bloc/register_controller.dart';
import 'package:tutor/auth/bloc/register_event.dart';
import 'package:tutor/auth/bloc/register_state.dart';
import 'package:tutor/auth/widgets/register_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state){
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar('Sign Up'),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Center(child: reUsableText('Enter your details below and free sign up')),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reUsableText('Username'),
                        buildTextField('Enter your username', 'name', 'user',
                                (value){
                              context.read<RegisterBloc>().add(UserNameEvent(value));
                            }
                        ),
                        reUsableText('Email'),
                        buildTextField('Enter your email', 'email', 'user',
                                (value){
                              context.read<RegisterBloc>().add(EmailEvent(value));
                            }
                        ),
                        reUsableText('Password'),
                        buildTextField('Enter your password', 'password', 'lock',
                                (value){
                              context.read<RegisterBloc>().add(PasswordEvent(value));
                            }
                        ),
                        reUsableText('Re-enter to confirm password'),
                        buildTextField('Re-enter your password', 'password', 'lock',
                                (value){
                              context.read<RegisterBloc>().add(RepassWordEvent(value));
                            }
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25.w),
                    child: reUsableText('Enter your details below and free sign up'),
                  ),
                  buildLogInAndRegButton('Sign Up', 'login', (){
                    RegisterController(context: context).handleEmailRegister();})
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
