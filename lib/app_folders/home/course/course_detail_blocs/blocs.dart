import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutor/app_folders/home/course/course_detail_blocs/events.dart';
import 'package:tutor/app_folders/home/course/course_detail_blocs/state.dart';

class CourseDetailBloc extends Bloc<CourseDetailEvents, CourseDetailState>{
  CourseDetailBloc():super(const CourseDetailState()){
    on<TriggerCourseDetail>(_triggerCourseDetail);
  }

  void _triggerCourseDetail(TriggerCourseDetail event, Emitter<CourseDetailState>emit){
    emit(state.copyWith(courseItem: event.courseItem));
  }
}