import 'package:example_1/data/model/task_model.dart';
import 'package:hive/hive.dart';

class DataListTasksLocal {
  final Box<TaskModel> box;
  int count = 0;
  DataListTasksLocal({required this.box});

  List<TaskModel> getList() {
    List<TaskModel> tasks = <TaskModel>[];
    if (box.values.toList().isEmpty) {
      tasks = <TaskModel>[];
    } else {
      for (final task in box.values.toList()) {
        tasks.add(task);
      }
    }
    return tasks;
  }

  void postList(TaskModel taskModel) {
    box.add(taskModel);
  }

  void removeAt(int index) {
    box.deleteAt(index);
  }

  void closeBox() {
    box.close();
  }

  void update(int index, TaskModel taskModel) {
    box.putAt(index, taskModel);
  }
}
