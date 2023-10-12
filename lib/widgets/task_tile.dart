// import 'package:flutter/material.dart';

// class TaskTile extends StatefulWidget {
//   const TaskTile({
//     super.key,
//     required this.task,
//   });

//   final String task;

//   @override
//   State<TaskTile> createState() => _TaskTileState();
// }

// class _TaskTileState extends State<TaskTile> {
//   bool isChecked = false;

//   void checkBoxState(bool checkBoxState) {
//     setState(() {
//       isChecked = checkBoxState;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(
//         widget.task,
//         style: TextStyle(
//             decoration: isChecked ? TextDecoration.lineThrough : null),
//       ),
//       trailing: TaskCheckbox(
//         checkBoxState: isChecked,
//         toggleCheckBoxState: checkBoxState,
//       ),
//     );
//   }
// }

// class TaskCheckbox extends StatelessWidget {
//   const TaskCheckbox({
//     super.key,
//     required this.checkBoxState,
//     required this.toggleCheckBoxState,
//   });

//   final bool checkBoxState;
//   final Function toggleCheckBoxState;

//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       value: checkBoxState,
//       onChanged: toggleCheckBoxState(),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class TaskTile extends StatefulWidget {
//   const TaskTile({
//     super.key,
//     required this.task,
//   });

//   final String task;

//   @override
//   State<TaskTile> createState() => _TaskTileState();
// }

// class _TaskTileState extends State<TaskTile> {
//   bool isChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(
//         widget.task,
//         style: TextStyle(
//             decoration: isChecked ? TextDecoration.lineThrough : null),
//       ),
//       trailing: TaskCheckbox(
//         checkBoxState: isChecked,
//         toggleCheckBoxState: (bool? value) {
//           setState(() {
//             isChecked = value ??
//                 false; // Use null-aware operator to handle null values.
//           });
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class TaskTile extends StatelessWidget {
//   final String title;
//   final bool isChecked;
//   final Function(bool?) checkboxCallback;
//   const TaskTile({super.key, required this.title, required this.isChecked, required this.checkboxCallback});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(
//         title,
//         style: TextStyle(
//             decoration: isChecked ? TextDecoration.lineThrough : null),
//       ),
//       trailing: Checkbox(
//         activeColor: Colors.lightBlueAccent,
//         value: isChecked,
//         onChanged: checkboxCallback,
//       ),
//     );
//   }
// }

// class TaskCheckbox extends StatelessWidget {
//   const TaskCheckbox({
//     Key? key,
//     required this.checkBoxState,
//     required this.toggleCheckBoxState,
//   }) : super(key: key);

//   final bool checkBoxState;
//   final void Function(bool?)? toggleCheckBoxState;

//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       value: checkBoxState,
//       onChanged: toggleCheckBoxState,
//     );
//   }
// }


import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isChecked;
  final Function(bool?) checkboxCallback;
  const TaskTile({super.key, required this.title, required this.isChecked, required this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}