import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class todotile extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletefun;

  todotile({super.key, required this.taskname, required this.taskcompleted, required this.onChanged, required this.deletefun});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right:25, top: 25),

      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
                onPressed: deletefun,
              icon: Icons.delete,
              backgroundColor: Colors.redAccent,
              borderRadius: BorderRadius.circular(12),
            ),

          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
        
          decoration: BoxDecoration(color: Colors.black26,
              borderRadius: BorderRadius.circular(15)),
        
          child: Row(
            children: [
        
              // checkbox
              Checkbox(value: taskcompleted, onChanged: onChanged, checkColor: Colors.black, activeColor: Colors.white30,),
        
        
              // task name
              Text(taskname,
              // line_through the text by checking the box
              style: TextStyle(decoration: taskcompleted ? TextDecoration.lineThrough : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
