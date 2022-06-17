import 'package:example_1/app/page/create_task_page/controller/create_task_controller.dart';
import 'package:example_1/data/repository/list_tasks_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final controller = Get.find<CreateTaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tạo thêm công việc'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextFormField(
            initialValue: controller.state.title.value,
            onChanged: controller.onChangeTitle,
            maxLength: 225,
            decoration: const InputDecoration(hintText: 'Nhập tiêu đề'),
          ),
          TextFormField(
            initialValue: controller.state.description.value,
            onChanged: controller.onChangeDescription,
            maxLines: null,
            maxLength: 225,
            decoration: const InputDecoration(hintText: 'Nhập mô tả công việc'),
          ),
          ElevatedButton(onPressed: () {
            FocusScope.of(context).unfocus();
            controller.onPost();
          }, child: Obx(() {
            return Text(controller.state.titleButton.value);
          }))
        ]),
      ),
    );
  }
}
