import 'package:tutor/Utilities/entities/course.dart';

abstract class CourseDetailEvents{
  const CourseDetailEvents();
}

class TriggerCourseDetail extends CourseDetailEvents{
  const TriggerCourseDetail(this.courseItem):super();
  final CourseItem courseItem;
}