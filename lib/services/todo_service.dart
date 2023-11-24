import 'package:flutter/material.dart';
import 'package:todooapp/models/task_model.dart';

class Taskprovider with ChangeNotifier {
  List<Task> tasks = [];
  // String? taskname;
  // final dateCont = TextEditingController();
  // final timeCont = TextEditingController();

  addTask(Task task) {
    tasks.add(task);
    print("Task added: ${task.title}");
    notifyListeners();
  }

  updateTask(Task task) {
    // Find the index of the task in the list
    var index = tasks.indexWhere((t) => t.id == task.id);
//update todo check it is in the list or not
    if (index != -1) {
      //
      tasks[index] = task;
      notifyListeners();
    }
  }

  deleteTask(id) {
    //remove task where id matches
    var index = tasks.indexWhere((element) => element.id == id);
    if (index != -1) tasks.removeAt(index);
    notifyListeners();
  }
}



// This is the code for adding date and time on adding onto the task
// bool get isValid =>
//     taskname != null && dateCont.text.isNotEmpty && timeCont.text.isNotEmpty;

//for task name to store all data in above task name which enter in the text
//   setTaskName(String? value) {
//     taskname = value;
//     notifyListeners(); //update the ui
//   }

// //date store text
// setDate(DateTime? date) {
//   if (date == null) {
//     return;
//   }

// DateTime currentDate = DateTime
//     .now(); // datetime.now() gives hours,minutes all give on it so we need short
// //so that'why we find a difference  and if difference is 0 it is today ,if it is 1 it is tomorrow

// Here we take a difference between 'date' upper portion look and currendate but it doesn't give correct diff becaz it gives value in hours,minutes...
// when we take a diff between date and now then we get a correct diff becaz it is in year,month...
// DateTime now =
//     DateTime(currentDate.year, currentDate.month, currentDate.day);

// int diff = date.difference(now).inDays;
// if (diff == 0) {
//take a differnce betwen them
//     dateCont.text = 'Today';
//   } else if (diff == 1) {
//     dateCont.text = 'Tomorrow';
//   } else {
//     dateCont.text = '${date.day}-${date.month}-${date.day}';
//   }
//   notifyListeners();
// }

//time store text
// setTime(TimeOfDay? time) {
//   if (time == null) {
//     return;
//   }
//   if (time.hour == 0) {
//     timeCont.text = "12:${time.minute} AM";
//   } else if (time.hour < 12) {
//     timeCont.text = "${time.hour}:${time.minute} AM";
//   } else if (hashCode == 12) {
//     timeCont.text = '${time.hour}:${time.minute} PM';
//   } else {
//     timeCont.text = '${time.hour - 12}:${time.minute} PM';
//   }
//   notifyListeners();
// }

//button to add task and store
// addTask() {
//   if (!isValid) {
//     return;
//   }
//   final task = Task(
//       taskname!, dateCont.text, timeCont.text, DateTime.now().toString());
//   tasks.add(task);
//   dateCont.clear();
//   timeCont.clear();
//   notifyListeners();
// }
