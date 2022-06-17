import 'package:example_1/app/page/create_task_page/controller/create_task_controller.dart';
import 'package:example_1/app/page/home_page/controller/home_controller.dart';
import 'package:example_1/common/constants/string_routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final controller = Get.find<HomeController>();
  final create = Get.find<CreateTaskController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách công việc'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          create.init();
          Get.toNamed(StringRoutesConstants.createTask);
        },
      ),
      body: Obx(() {
        if (controller.state.listTasks.isEmpty) {
          return const Center(
            child: Text('Không có công việc'),
          );
        }
        return ListView.separated(
            padding: const EdgeInsets.only(top: 12),
            itemBuilder: (_, index) {
              final task = controller.state.listTasks[index];
              return InkWell(
                onLongPress: () {
                  Get.defaultDialog(
                      title: 'Bạn muốn xoá',
                      onConfirm: () {
                        controller.removeAt(index);
                        Get.back();
                      },
                      onCancel: () {
                        Get.back();
                      });
                },
                onTap: () {
                  create.init(index: index);
                  Get.toNamed(StringRoutesConstants.createTask);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(task.title), Text(task.description)],
                      ),
                      const Icon(Icons.arrow_right)
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, index) {
              return const Divider(
                color: Colors.black,
              );
            },
            itemCount: controller.state.listTasks.length);
      }),
    );
  }
}
