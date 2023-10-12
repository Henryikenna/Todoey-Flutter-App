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
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/models/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});
  @override
  Widget build(BuildContext context) {
    // final taskProvider = Provider.of<TheTaskData>(context);
    return Consumer<TheTaskData>(
      builder: (context, taskProvider, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskProvider.tasks[index];
            return TaskTile(
                title: task.name,
                isChecked: task.isDone,
                checkboxCallback: (checkboxState) {
                  // setState(() {
                  //   widget.tasks[index].toggleDone();
                  // });
                  taskProvider.updateTask(task);
                }, longPressCallback: () { 
                  taskProvider.deleteTask(task);
                 },);
          },
          itemCount: taskProvider.taskCount,
        );
      },
    );
  }
}
