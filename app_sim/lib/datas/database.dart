import 'package:hive_flutter/hive_flutter.dart';

class tododatabase{
  List todolist = [];

  final _mybox = Hive.box('mybox');

  void createintitialdata(){
    todolist = [
      ["HomeWork", false],
      ["PlayGame", false],
    ];
  }

  void load(){
    todolist = _mybox.get("TODOLIST");
  }

  void update(){
    _mybox.put('TODOLIST', todolist);

  }

}