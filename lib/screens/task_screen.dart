// import 'package:flutter/material.dart';
// import 'package:todoey_flutter/model/models/task.dart';
// import 'package:todoey_flutter/screens/add_task_screen.dart';
// import 'package:todoey_flutter/widgets/tasks_list.dart';

// class TasksScreen extends StatefulWidget {
//   const TasksScreen({super.key});

//   @override
//   State<TasksScreen> createState() => _TasksScreenState();
// }

// class _TasksScreenState extends State<TasksScreen> {
//    bool checked = false;

//   List<Task> tasks = [
//     Task(name: 'Buy milk'),
//     Task(name: 'Buy ketchup'),
//     Task(name: 'Buy bread'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightBlueAccent,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showModalBottomSheet(
//             context: context,
//             builder: (context) => const AddTaskScreen(),
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               ),
//             ),
//           );
//         },
//         backgroundColor: Colors.lightBlueAccent,
//         child: const Icon(Icons.add),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: const EdgeInsets.only(
//                 top: 60.0, left: 30.0, bottom: 30.0, right: 30.0),
//             child: const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.white,
//                   radius: 30,
//                   child: Icon(
//                     Icons.list,
//                     size: 30,
//                     color: Colors.lightBlueAccent,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   "Todoey",
//                   style: TextStyle(
//                     fontSize: 50,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Text(
//                   "12 Tasks",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   topRight: Radius.circular(20),
//                 ),
//               ),
//               padding: const EdgeInsets.only(left: 30.0, right: 30),
//               child: const TasksList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




// // class ListItem extends StatelessWidget {
// //   const ListItem({
// //     super.key,
// //     required this.item,
// //   });

// //   final String item;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 20),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Text(
// //             item,
// //             style: const TextStyle(fontSize: 16),
// //           ),
// //           const Icon(
// //             Icons.check_box_outline_blank,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }


import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/main.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  bool checked = false;

  

  @override
  Widget build(BuildContext context) {

final taskProvider = Provider.of<TheTaskData>(context);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: taskProvider.addTasks(context),
                ),
              ),
            );
          },
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding:
                  const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      size: 30,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Todoey',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Text(
                   "${Provider.of<TheTaskData>(context).tasks.length.toString()} Tasks",
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: TasksList(taskProvider.tasks),
              ),
            )
          ],
        ));
  }
}