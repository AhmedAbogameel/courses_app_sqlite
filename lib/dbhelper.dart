import 'package:courses_app_sqlite/model/course.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  // to make one object only when dev call the class constructor many times
  static final DBHelper _instance = DBHelper.internal();
  factory DBHelper()=> _instance;
  DBHelper.internal();
  static Database _db;

  Future<Database> createDatabase()async{
    if(_db != null){
      return _db;
    }
    // define path to database
    String path = join(await getDatabasesPath(),'school.db');
    _db = await openDatabase(path,version: 1,onCreate: (Database db,int version){
      // creating tables
      db.execute('create table courses(id integer primary key autoincrement, name varchar(50), content varchar(255), hours integer)');
    });
    return _db;
  }

  Future<int> createCourse(Course course)async{
    Database db = await createDatabase();
    return db.insert('courses', course.toMap());
  }

  Future<List>allCourses()async{
    Database db = await createDatabase();
    return db.query('courses');
  }

  Future<int> delete(int id)async{
    Database db = await createDatabase();
    return db.delete('courses',where: 'id = ?',whereArgs: [id]);
    // if we want to specific an element with more args
    // db.delete('courses',where: 'id = ? and name = ?',whereArgs: [id , name]);
  }
  Future<int> courseUpdate(Course course)async{
    Database db = await createDatabase();
    return await db.update('courses', course.toMap(),where: 'id = ?',whereArgs: [course.id]);
  }
}