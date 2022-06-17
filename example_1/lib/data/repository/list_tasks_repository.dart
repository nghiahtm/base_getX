import 'package:example_1/data/data/local/data_list_task_local.dart';
import 'package:example_1/data/model/task_model.dart';

class ListTasksRepository {
  final DataListTasksLocal local;

  ListTasksRepository({required this.local});
  void postList(TaskModel taskModel) {
    local.postList(taskModel);
  }

  void removeAt(int index) {
    local.removeAt(index);
  }

  List<TaskModel> getListTasks() {
    return local.getList();
  }

  void updateTask(int index, TaskModel task) {
    local.update(index, task);
  }
}
