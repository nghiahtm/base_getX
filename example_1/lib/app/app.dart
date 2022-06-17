import 'package:example_1/app/routes.dart';
import 'package:example_1/common/constants/string_routes_constants.dart';
import 'package:example_1/common/di/bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      initialRoute: StringRoutesConstants.home,
      initialBinding: AppBindings(),
      getPages: MainRoute.getPages,
    );
  }
}
