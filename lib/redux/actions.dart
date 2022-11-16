import 'package:pesu_io1/models/student.dart';

abstract class Action{}

class AddStudent extends Action{
  Student newStudent;
  AddStudent({required this.newStudent});
}

class RemoveStudent extends Action {
  String name;
  // RemoveStudent(String name) {
  //   this.name = name;
  // }

  RemoveStudent({required this.name});
}