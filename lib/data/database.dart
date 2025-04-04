import 'package:hive/hive.dart';

class ToDoDataBase{
  List toDolist=[];
  final _myBox=Hive.box('myBox');
  void createInitData(){
     List<List<dynamic>> toDolist = [
    ['Do homework', false],
    ['Buy groceries', false],
    ['Workout', false],
    ['Read a book', false],
  ];
  }
 void loadData(){
  toDolist=_myBox.get('TODOLIST');
 }
 void update(){
  _myBox.put('TODOLIST', toDolist);
 }
}