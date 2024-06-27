import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_isolates_showcase/services/computation_service.dart';
import 'package:mvvm_isolates_showcase/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MVVM + Isolate Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
      initialBinding: InitialBinding(),
    );
  }
}

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ComputationService());
  }
}
