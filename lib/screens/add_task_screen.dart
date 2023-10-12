// import 'package:flutter/material.dart';

// class AddTaskScreen extends StatelessWidget {
//   const AddTaskScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
// padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
//       child: Column(
//         children: [
//           const Text(
//             "Add Task",
//             style: TextStyle(
//               color: Colors.lightBlueAccent,
//               fontSize: 20,
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           const TextField(

//   autofocus: true,
//   textAlign: TextAlign.center,
// decoration: InputDecoration(
//   focusColor: Colors.lightBlueAccent,
//   focusedBorder: UnderlineInputBorder(
//     borderSide: BorderSide(width: 3, color: Colors.lightBlueAccent),
//   ),
//   enabledBorder: UnderlineInputBorder(
//     borderSide: BorderSide(width: 3, color: Colors.lightBlueAccent),
//   ),
// ),
//           ),
// const SizedBox(
//   height: 20,
// ),
// SizedBox(
//   width: double.infinity,
//   height: 50,
//   child: TextButton(
//     onPressed: () {},

//     style: ButtonStyle(

//       backgroundColor: MaterialStateProperty.all(
//         Colors.lightBlueAccent,
//       ),
//       shape: const MaterialStatePropertyAll(
//         RoundedRectangleBorder(
//           borderRadius: BorderRadius.zero,
//         ),
//       ),
//     ),
//     child: const Text(
//       "Add",
//       style: TextStyle(
//         color: Colors.white,
//         fontWeight: FontWeight.w400,
//         fontSize: 16,
//       ),
//     ),
//   ),
// ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;
  const AddTaskScreen(this.addTaskCallback, {super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    late String newTaskTitle;

    return Container(
      color: const Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            )),
        child: Padding(
          // padding: const EdgeInsets.only(top: 30, left: 60, right: 60),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            children: <Widget>[
              const Text(
                'Add Tasks',
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 20),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                autofocus: true,
                decoration: const InputDecoration(
                  focusColor: Colors.lightBlueAccent,
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 3, color: Colors.lightBlueAccent),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 3, color: Colors.lightBlueAccent),
                  ),
                ),
                onChanged: (newValue) {
                  newTaskTitle = newValue;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    addTaskCallback(newTaskTitle);
                    //TODO: Add Task to todolist
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.lightBlueAccent,
                    ),
                    shape: const MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                  child: const Text(
                    "Add",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
