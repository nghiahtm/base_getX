import 'package:example_1/data/model/task_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RegisterAdapter {
  static void register() {
    Hive.registerAdapter(TaskModelAdapter());
  }
}
