// import 'package:flutter/material.dart';
// import 'package:todoey_flutter/widgets/task_tile.dart';

// class TasksList extends StatefulWidget {
//   const TasksList({
//     super.key,
//   });

//   @override
//   State<TasksList> createState() => _TasksListState();
// }

// class _TasksListState extends State<TasksList> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children:  [
//         TaskTile(task: "Buy Milk",),
//         TaskTile(task: "Buy Eggs",),
//         TaskTile(task: "Buy Bread",),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:todoey_flutter/model/models/task.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;
  const TasksList(this.tasks, {super.key});
  @override
  // ignore: library_private_types_in_public_api
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {



    return ListView.builder(
      itemBuilder: (context, index) {
        final task = widget.tasks[index];
        return TaskTile(
            title: task.name,
            isChecked: task.isDone,
            checkboxCallback: (checkboxState) {
              setState(() {
                widget.tasks[index].toggleDone();
              });
            });
      },
      itemCount: widget.tasks.length,
    );
  }
}
