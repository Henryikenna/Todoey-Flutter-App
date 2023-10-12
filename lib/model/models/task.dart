// class Task {
// Task({required this.name});

//   final String name;
  

  

// }
// class Task {
// Task({required this.name, this.isDone = false});

//   final String name;
//   bool isDone;

  

//   void toggleDone() {
//     isDone = !isDone;
//   }
// }


class Task{
  final String name;
  bool isDone;

  Task({required this.name, this.isDone = false});


  void toggleDone() {
    isDone = !isDone;
    // notifyListeners();
  }
}