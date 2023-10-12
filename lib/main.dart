import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/models/task.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:todoey_flutter/screens/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => TheTaskData(),
        builder: (context, child) {
          return const TasksScreen();
        },
      ),
      // home: HomePage(),
    );
  }
}

class TheTaskData extends ChangeNotifier {
  

  

  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy ketchup'),
    Task(name: 'Buy bread'),
  ];

  Widget addTasks(BuildContext context) {
    return AddTaskScreen((newTaskTitle) {
      tasks.add(
        Task(name: newTaskTitle),
      );
      Navigator.pop(context);

      notifyListeners();
    });
  }

  

}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<Data>(
//       create: (context) => Data(),
//       builder: (context, child) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text(Provider.of<Data>(context, listen: false).data),
//           ),
//           body: const Column(
//             children: [
//               MyTextField(),
//               Level1(),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class Level1 extends StatelessWidget {
//   const Level1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(child: const Level2());
//   }
// }

// class Level2 extends StatelessWidget {
//   const Level2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(child: const Level3());
//   }
// }

// class Level3 extends StatelessWidget {
//   const Level3({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Center(child: Text(Provider.of<Data>(context).data)),
//       ],
//     );
//   }
// }

// class MyTextField extends StatelessWidget {
//   const MyTextField({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       onChanged: (value) {
//         Provider.of<Data>(context, listen: false).changeData(value);
//       },
//     );
//   }
// }

// class Data extends ChangeNotifier {
//   String data =
//       "Header";

//   void changeData(String value) {
//     data = value;
//     notifyListeners();
//   }
// }
