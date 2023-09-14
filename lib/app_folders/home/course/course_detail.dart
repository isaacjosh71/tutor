import 'package:flutter/cupertino.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({Key? key}) : super(key: key);

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    print(id.values.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
