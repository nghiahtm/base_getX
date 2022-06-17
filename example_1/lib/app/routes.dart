import 'package:example_1/app/page/create_task_page/create_task_page.dart';
import 'package:example_1/app/page/home_page/home_page.dart';
import 'package:example_1/common/constants/string_routes_constants.dart';
import 'package:get/get.dart';

class MainRoute {
  static List<GetPage<dynamic>>? getPages = [
    // ignore: prefer_const_constructors
    GetPage(name: StringRoutesConstants.home, page: () => HomePage()),
    GetPage(
        name: StringRoutesConstants.createTask,
        page: () => const CreateTaskPage())
  ];
}
