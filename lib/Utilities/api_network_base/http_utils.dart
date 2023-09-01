import 'package:dio/dio.dart';
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

  Future post(String path, {dynamic myData, Map<String, dynamic>? queryParameters}) async{
    var response = await dio.post(
        path,
      data: myData,
      queryParameters: queryParameters
    );
    print('my data response is ${response.toString()}');
    print('my status code is ${response.statusCode}');
   return response.data;
  }
}