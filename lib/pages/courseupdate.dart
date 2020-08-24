import 'package:courses_app_sqlite/dbhelper.dart';
import 'package:courses_app_sqlite/model/course.dart';
import 'package:courses_app_sqlite/pages/home.dart';
import 'package:flutter/material.dart';

class CourseUpdate extends StatefulWidget {

  final Course course;
  CourseUpdate(this.course);

  @override
  _CourseUpdateState createState() => _CourseUpdateState();
}

class _CourseUpdateState extends State<CourseUpdate> {
  TextEditingController teName = TextEditingController();
  TextEditingController teContent = TextEditingController();
  TextEditingController teHours = TextEditingController();
  DBHelper helper = DBHelper();

  @override
  void initState() {
    teName.text = widget.course.name;
    teContent.text = widget.course.content;
    teHours.text = widget.course.hours.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Course Update'),),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            TextField(
              controller: teName,
            ),
            SizedBox(height: 20,),
            TextField(
              controller: teContent,
              maxLines: null,
            ),
            SizedBox(height: 20,),
            TextField(
              controller: teHours,
            ),
            RaisedButton(
              child: Text('Save'),
              onPressed: (){
                var updatedCourse = Course({
                  'id':widget.course.id,
                  'name':teName.text,
                  'content':teContent.text,
                  'hours': int.parse(teHours.text),
                });
                helper.courseUpdate(updatedCourse);
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Home()));
              },
            )
          ],
        ),
      ),
    );
  }
}
