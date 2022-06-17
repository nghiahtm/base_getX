import 'package:example_1/app/page/create_task_page/controller/create_task_state.dart';
import 'package:example_1/app/page/home_page/controller/home_controller.dart';
import 'package:example_1/data/model/task_model.dart';
import 'package:example_1/data/repository/list_tasks_repository.dart';
import 'package:get/get.dart';

class CreateTaskController extends GetxController {
  CreateTaskState state = CreateTaskState();
  final ListTasksRepository repository;
  final HomeController homeController;
  int? index;

  CreateTaskController(
      {required this.repository, required this.homeController});
  void init({int? index}) {
    this.index = index;
    if (index != null) {
      final task = homeController.state.listTasks[index];
      state.description.value = task.description;
      state.title.value = task.title;
      state.titleButton = 'Cập nhật'.obs;
    } else {
      state.description.value = '';
      state.title.value = '';
      state.titleButton = 'Thêm'.obs;
    }
  }

  void onChangeTitle(String value) {
    state.title.value = value;
  }

  void onChangeDescription(String value) {
    state.description.value = value;
  }

  void onPost() {
    if (index != null) {
      repository.updateTask(
          index ?? 0, TaskModel(state.title.value, state.description.value));
      homeController.state.listTasks[index ?? 0] =
          TaskModel(state.title.value, state.description.value);
      Get.back();
    } else {
      repository
          .postList(TaskModel(state.title.value, state.description.value));
      homeController.state.listTasks
          .add(TaskModel(state.title.value, state.description.value));
      Get.back();
    }
  }
}
