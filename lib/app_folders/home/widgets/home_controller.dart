import 'package:flutter/cupertino.dart';
import 'package:tutor/Utilities/entities/entities.dart';

import '../../../Utilities/services/global.dart';

class HomeController{
  final BuildContext context;
  HomeController({required this.context});
  UserItem? getUserProfile  = Global.storageServices.getUserProfile();

  void init(){

  }
}