import 'package:example_1/app/app.dart';
import 'package:example_1/common/config/register_adapter.dart';
import 'package:example_1/data/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'common/constants/string_open_box.dart';

Future<void> main() async {
  await Hive.initFlutter();
  RegisterAdapter.register();
  await Hive.openBox<TaskModel>(StringOpenBox.openListTask);
  runApp(const App());
}
