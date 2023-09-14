import 'package:tutor/Utilities/entities/course.dart';

import '../api_network_base/http_utils.dart';

class CourseAPI{
 static Future<CourseListResponseEntity> courseList() async{
    var response = HttpUtil().post(
      'api/courseList'
    );
    print(response.toString());
    return CourseListResponseEntity.fromJson(response as Map<String, dynamic>);
  }
}