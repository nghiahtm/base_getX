import 'package:example_1/app/page/home_page/controller/home_state.dart';
import 'package:example_1/data/repository/list_tasks_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ListTasksRepository repository;

  HomeState state = HomeState();

  HomeController({required this.repository});
  @override
  void onInit() {
    state.listTasks.value = repository.getListTasks();
    super.onInit();
  }

  void removeAt(int index) {
    repository.removeAt(index);
    state.listTasks.removeAt(index);
  }
}
