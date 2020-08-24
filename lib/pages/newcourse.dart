import 'package:courses_app_sqlite/dbhelper.dart';
import 'package:courses_app_sqlite/model/course.dart';
import 'package:courses_app_sqlite/pages/home.dart';
import 'package:flutter/material.dart';

class NewCourse extends StatefulWidget {
  @override
  _NewCourseState createState() => _NewCourseState();
}

class _NewCourseState extends State<NewCourse> {
  String name , content;
  int hours;
  DBHelper _dbHelper;

  @override
  void initState() {
    super.initState();
    _dbHelper = DBHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Course'),),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Course name',
                ),
                onChanged: (value){
                  setState(() {
                    name = value;
                  });
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'Enter Course content',
                ),
                onChanged: (value){
                  setState(() {
                    content = value;
                  });
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter Course hours',
                ),
                onChanged: (value){
                  setState(() {
                    hours = int.parse(value);
                  });
                },
              ),
              SizedBox(height: 15,),
              RaisedButton(
                child: Text('Save'),
                onPressed: ()async{
                  Course course = Course({
                    'name':name,
                    'content':content,
                    'hours':hours,
                  });
                  int id = await _dbHelper.createCourse(course);
                  Navigator.pop(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Home()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
