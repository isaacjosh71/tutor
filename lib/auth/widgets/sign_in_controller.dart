import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tutor/Utilities/entities/entities.dart';
import 'package:tutor/Utilities/repositories/user_repo.dart';
import 'package:tutor/Utilities/services/global.dart';
import 'package:tutor/Utilities/values/constants.dart';
import 'package:tutor/Utilities/widget/flutter_toast.dart';
import 'package:tutor/auth/bloc/sign_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController{
  final BuildContext context;
  const SignInController({ required this.context});

  void handleSignIn(String type) async{
    try{
     if(type=='email'){
       final state = context.read<SignInBloc>().state;
       String emailAddress = state.email;
       String password = state.password;
       if(emailAddress.isEmpty){
         //
         toastInfo(msg: 'You need to fill in email');
         return;
       }
       if(password.isEmpty){
         toastInfo(msg: 'You need to fill in password');
         return;
         //
       } try{
         final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
             email: emailAddress, password: password);
         if(credential.user==null){
           toastInfo(msg: 'User doesn\'t exist');
           return;
           //
         }
         if(!credential.user!.emailVerified){
          toastInfo(msg: 'You need to verify email');
          return;
           //not verified
         }
         var user = credential.user;
         if(user!=null){
           String? displayName = user.displayName;
           String? email = user.email;
           String? id = user.uid;
           String? photoUrl = user.photoURL;

           LoginRequestEntity loginRequestEntity = LoginRequestEntity();
           loginRequestEntity.avatar = photoUrl;
           loginRequestEntity.email = email;
           loginRequestEntity.open_id = id;
           loginRequestEntity.name = displayName;

           //type 1 indicates email login
           loginRequestEntity.type = 1;

           print('user exist');
           asyncPostAllData(
               loginRequestEntity
           );
           //we got verified user from firebase
         } else{
           toastInfo(msg: 'Currently you are not a user on this app');
           return;
           //error getting user from firebase
         }
       } on FirebaseAuthException catch(e){
         if (e.code == 'user-not-found'){
           toastInfo(msg: 'No user found for that email');
         } else if (e.code=='wrong-password'){
           toastInfo(msg: 'Wrong password found for that user');
         } else if (e.code=='invalid-email'){
           toastInfo(msg: 'Your email id is wrong');
         }
       }
     }
    } catch(e){}
  }

  void asyncPostAllData(
      LoginRequestEntity loginRequestEntity
      ) async {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true
    );
    // Global.storageServices.setString(AppConsts.USER_TOKEN_KEY, '12345');
    // EasyLoading.dismiss();
    // Navigator.of(context).pushNamedAndRemoveUntil('/rootPage', (route) => false);
    var result = await UserRepo.login(params: loginRequestEntity);
    if(result.code==200){
      try{
        Global.storageServices.setString(AppConsts.USER_PROFILE_KEY, jsonEncode(result.data));
        Global.storageServices.setString(AppConsts.USER_TOKEN_KEY, result.data!.access_token!);
        EasyLoading.dismiss();
        Navigator.of(context).pushNamedAndRemoveUntil('/rootPage', (route) => false);
      }catch(e){
        print('saving local storage error ${e.toString()}');
      }
    }
    else{
      EasyLoading.dismiss();
      toastInfo(msg: 'unknown error');
    }
  }
}