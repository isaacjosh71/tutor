import 'package:dio/dio.dart';
import 'package:tutor/Utilities/services/global.dart';
import 'package:tutor/Utilities/values/constants.dart';

class HttpUtil{
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil(){
    return _instance;
  }

  late Dio dio;

  HttpUtil._internal(){
    BaseOptions options = BaseOptions(
      baseUrl: AppConsts.SERVER_API_URI,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: 'application/json: charset=utf-8',
      responseType: ResponseType.json
    );
    dio = Dio(options);
  }

  Future post(String path, {dynamic myData, Map<String, dynamic>? queryParameters, Options? options}) async{
    Options requestOptions = options?? Options();
    requestOptions.headers = requestOptions.headers??{};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if(authorization != null){
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.post(
        path,
      data: myData,
      queryParameters: queryParameters,
        options: requestOptions
    );
    print('my data response is ${response.toString()}');
    print('my status code is ${response.statusCode}');
   return response.data;
  }

  Map<String, dynamic>? getAuthorizationHeader(){
    var headers = <String, dynamic>{};//first empty
    var accessToken = Global.storageServices.getUserToken();
    if(accessToken.isNotEmpty){
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }
}