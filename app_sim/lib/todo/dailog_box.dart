import 'package:app_sim/todo/my_button.dart';
import 'package:flutter/material.dart';

class dialogbox extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback oncancel;

  dialogbox({super.key, required this.oncancel, required this.onsave, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey[200],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          // get user input
          TextField(
            controller: controller,
            decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Add a anew tasks"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              // save button
              mybutton(text: "Save", onPressed: onsave),
              const SizedBox(width: 9,),

              // cancel button
              mybutton(text: "Cancel", onPressed: oncancel),



            ],
          )
        ],
        ),
      ),
    );
  }
}
