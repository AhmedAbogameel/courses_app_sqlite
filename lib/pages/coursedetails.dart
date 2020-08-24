import 'package:courses_app_sqlite/model/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CourseDetails extends StatelessWidget {

  final Course course;
  CourseDetails(this.course);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(course.name),
            SizedBox(height: 20,),
            Text(course.content),
            SizedBox(height: 20,),
            Text(course.hours.toString(),style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
          ],
        ),
      ),
    );
  }
}
