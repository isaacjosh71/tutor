import 'package:tutor/Utilities/values/constants.dart';
import 'package:tutor/auth/bloc/register_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Utilities/widget/flutter_toast.dart';

class RegisterController{
  final BuildContext context;
  const RegisterController({required this.context});

  void handleEmailRegister() async{
    //BlocProvider.of<SignInBloc>(context).state
    final state = context.read<RegisterBloc>().state;
    String emailAddress = state.email;
    String password = state.password;
    String rePassword = state.rePassword;
    String userName = state.userName;

    if(userName.isEmpty){
      toastInfo(msg: 'You need to fill in username');
      return;
    }
    if(password.isEmpty){
      toastInfo(msg: 'You need to fill in password');
      return;
    }
    if(emailAddress.isEmpty){
      toastInfo(msg: 'You need to fill in email');
      return;
    }
    if(rePassword.isEmpty){
      toastInfo(msg: 'Your password confirmation is wrong');
      return;
    }
    try{
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress, password: password);
      if(credential.user!=null){
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        String photoUrl = 'uploads/default.png';
        await credential.user?.updatePhotoURL(photoUrl);
        toastInfo(msg: 'An email has been sent to your registered email. To activate, please click the link sent to your email.');
        Navigator.of(context).pop();
        return;
      }
      if(!credential.user!.emailVerified){
        toastInfo(msg: 'You need to verify email');
        return;
      }
      var user = credential.user;
      if(user!=null){
        print('user exist');
        //we got verified user from firebase
      } else{
        toastInfo(msg: 'Currently you are not a user on this app');
        return;
        //error getting user from firebase
      }
    }
    on FirebaseAuthException catch(e){
      if (e.code == 'weak-password'){
        toastInfo(msg: 'The password provided is too weak');
      } else if (e.code=='email-already-in-use'){
        toastInfo(msg: 'Email already in use');
      } else if (e.code=='invalid-email'){
        toastInfo(msg: 'Your email id is wrong');
      }
    }
  }
}