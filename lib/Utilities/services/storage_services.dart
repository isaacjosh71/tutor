import 'dart:convert';

import 'package:tutor/Utilities/entities/entities.dart';
import 'package:tutor/Utilities/values/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServices{
  late final SharedPreferences _prefs;

  Future<StorageServices> init() async{
    _prefs = await SharedPreferences.getInstance();
    return this;
}


  Future<bool> setBool(String key, bool value) async{
    return await _prefs.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async{
    return await _prefs.setString(key, value);
  }

  //skip on_boarding
  bool getDeviceFirstOpen(){
    return _prefs.getBool(AppConsts.STORAGE_DEVICE_OPEN_FIRST_TIME)??false;
  }

  //check user logged in
  bool getIsLoggedIn(){
    return _prefs.getString(AppConsts.USER_TOKEN_KEY)==null?false:true;
  }

  //remove key
  Future<bool> remove(String key){
    return _prefs.remove(key);
  }

  //get user profile
  UserItem? getUserProfile(){
    var profileOffline = _prefs.getString(AppConsts.USER_PROFILE_KEY)??'';
    if(profileOffline.isNotEmpty){
      return UserItem.fromJson(jsonDecode(profileOffline));
    }
    return null;
  }
}