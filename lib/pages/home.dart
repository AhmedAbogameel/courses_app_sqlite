import 'package:courses_app_sqlite/dbhelper.dart';
import 'package:courses_app_sqlite/model/course.dart';
import 'package:courses_app_sqlite/pages/coursedetails.dart';
import 'package:courses_app_sqlite/pages/courseupdate.dart';
import 'package:courses_app_sqlite/pages/newcourse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  DBHelper helper;

  @override
  void initState() {
    helper = DBHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Database'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NewCourse())),
          ),
        ],
      ),
      body: FutureBuilder(
        future: helper.allCourses(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if (snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context , index){
                Course course = Course.fromMap(snapshot.data[index]);
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text('${course.name} - ${course.hours} hours'),
                    subtitle: Text(course.content),
                    trailing: Column(
                      children: [
                        Expanded(
                          child: IconButton(icon: Icon(Icons.delete,color: Colors.red,), onPressed: (){
                            setState(() {
                              helper.delete(course.id);
                            });
                          }),
                        ),
                        Expanded(
                          child: IconButton(icon: Icon(Icons.edit,color: Colors.green,), onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (_)=> CourseUpdate(course)))),
                        ),
                      ],
                    ),
                    onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CourseDetails(course))),
                  ),
                );
              },
            );
          }
          return null;
        },
      ),
    );
  }
}
