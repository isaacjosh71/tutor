import 'package:tutor/Utilities/services/global.dart';
import 'package:tutor/Utilities/values/constants.dart';
import 'package:tutor/Utilities/widget/flutter_toast.dart';
import 'package:tutor/auth/bloc/sign_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController{
  final BuildContext context;
  const SignInController({ required this.context});

  void handleSignIn(String type) async{
    try{
     if(type=='email'){
       //BlocProvider.of<SignInBloc>(context).state
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
           print('user exist');
           Global.storageServices.setString(AppConsts.USER_TOKEN_KEY, '1234567');
           Navigator.of(context).pushNamedAndRemoveUntil('/rootPage', (route) => false);
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
    } catch(e){

    }
  }
}