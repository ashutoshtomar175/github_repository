import 'package:app_sim/datas/database.dart';
import 'package:app_sim/todo/dailog_box.dart';
import 'package:app_sim/todo/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  // refe
  final _mybox = Hive.box("mybox");
  tododatabase d = tododatabase();

  @override
  void initState() {
    if (_mybox.get("TODOLIST") == null){
      d.createintitialdata();
    }
    else {
      d.load();
    }
    // TODO: implement initState
    super.initState();
  }




  // text controller
  final _controller  = TextEditingController();


  // check box was tapped
  void checkboxchanged(bool? value, int index){
    setState(() {
      d.todolist[index][1] = !d.todolist[index][1];
    });
    d.update();
  }

  // save a new task
  void shownewtask(){
    setState(() {
      d.todolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    d.update();
  }

  // create a new task
  void createnewtask(){
    showDialog(context: context, builder: (context){
      return dialogbox(
        controller: _controller ,
        oncancel: () => Navigator.of(context).pop(),
        onsave: shownewtask,
      );
    });
  }

  // delete a task
  void deletetask (int index){
    setState(() {
      d.todolist.removeAt(index);
    });
    d.update();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blueGrey,

      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[300],
        title: Text("TO DO LIST"),
      ),

      // floating Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey[300],
        onPressed: createnewtask,
        child: Icon(Icons.add),
      ),

      // BODY
      body: ListView.builder(
        itemCount: d.todolist.length,
        itemBuilder: (context, index){
          return todotile(
            deletefun: (context)=> deletetask(index),
              taskname: d.todolist[index][0], taskcompleted:d.todolist[index][1] , onChanged:(value) => checkboxchanged(value, index));
        },
        
        // children: [
        //   // this is not dynamic since it not real time responding user comand
        //   // todotile(
        //   //   taskcompleted: true,
        //   //   taskname: "STUDY",
        //   //   onChanged: (p0){},
        //   // ),
        //   // todotile(
        //   //   taskcompleted: false,
        //   //   taskname: "Play Game",
        //   //   onChanged: (p0){},
        //   // ),
        //
        // ],
      ),
    );
  }
}
