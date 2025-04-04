import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:pixel_to_do_app/data/database.dart';
import 'package:pixel_to_do_app/pages/boxstyle.dart';
import 'package:pixel_to_do_app/utils/alert_box.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  
  State<Home> createState() => _HomeState();
}
final _myBox = Hive.box('myBox');


class _HomeState extends State<Home> {
 ToDoDataBase db =ToDoDataBase();
 @override
  void initState() {
    if(_myBox.get('TODOLIST')==null){
      db.createInitData();
    } 
    else{
      db.loadData();
    }
    super.initState();
  }

  final TextEditingController _controller = TextEditingController();

  void CheckboxChanged(bool? value, int index) {
    setState(() {
      db.toDolist[index][1] = !db.toDolist[index][1];
      db.update();
    });
  }

  void savenewtask() {
    setState(() {
      db.toDolist.add([_controller.text, false]);
      _controller.clear(); // Clear input field after saving
    });
    Navigator.of(context).pop(); // Close the dialog
    db.update();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertBox(
          controller: _controller, // Pass the existing controller
          oncancel: () => Navigator.of(context).pop(),
          onsave: savenewtask,
          
        );
      },
    );
  }
void deletetask(int index ){
  setState(() {
    db.toDolist.removeAt(index);
    db.update();
  });

}
  @override
  void dispose() {
    _controller.dispose(); // Dispose of controller to free memory
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'To-Do List',
          style: GoogleFonts.pressStart2p(
            fontSize: 15,
            color: Colors.green,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
          color: Colors.black,
          size: 40,
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDolist.length,
        itemBuilder: (context, index) => Boxstyle(
          taskName: db.toDolist[index][0],
          taskCompleted: db.toDolist[index][1],
          onChanged: (value) => CheckboxChanged(value, index),
          deletefunction: (context){
            deletetask(index);
          },
        ),
      ),
    );
  }
}
