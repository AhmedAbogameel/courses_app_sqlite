class Course {
  int _id;
  int _hours;
  String _name;
  String _content;

  Course(dynamic obj){
    _id = obj['id'];
    _name = obj['name'];
    _hours = obj['hours'];
    _content = obj['content'];
  }

  Course.fromMap(Map<String,dynamic> data){
    _id = data['id'];
    _name = data['name'];
    _hours = data['hours'];
    _content = data['content'];
  }

  Map<String,dynamic> toMap()=> {
    'id':_id,
    'name':_name,
    'content':_content,
    'hours':_hours,
  };

  int get id => _id;
  int get hours => _hours;
  String get name => _name;
  String get content => _content;
}