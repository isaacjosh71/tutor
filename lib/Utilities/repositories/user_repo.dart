import 'package:tutor/Utilities/entities/entities.dart';

import '../api_network_base/http_utils.dart';

class UserRepo{
  static login({LoginRequestEntity? params}) async{
    var response = await HttpUtil().post(
      'api/login',
          queryParameters: params?.toJson()
    );
    UserLoginResponseEntity.fromJson(response);
  }
}