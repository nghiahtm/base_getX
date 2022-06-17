import 'package:example_1/app/page/create_task_page/controller/create_task_controller.dart';
import 'package:example_1/app/page/home_page/controller/home_controller.dart';
import 'package:example_1/common/constants/string_open_box.dart';
import 'package:example_1/data/data/local/data_list_task_local.dart';
import 'package:example_1/data/model/task_model.dart';
import 'package:example_1/data/repository/list_tasks_repository.dart';
import 'package:get/instance_manager.dart';
import 'package:hive/hive.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    _configureGetData();
    _configureRepository();
    _configureGetController();
  }

  void _configureRepository() {
    Get.put(ListTasksRepository(local: Get.find<DataListTasksLocal>()));
  }

  void _configureGetController() {
    Get.put(HomeController(repository: Get.find<ListTasksRepository>()));
    Get.lazyPut(() => CreateTaskController(
        repository: Get.find<ListTasksRepository>(),
        homeController: Get.find<HomeController>()));
  }

  void _configureGetData() {
    Get.put(DataListTasksLocal(
        box: Hive.box<TaskModel>(StringOpenBox.openListTask)));
  }
}
