import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_isolates_showcase/viewmodels/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  final HomeViewModel _viewModel = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVVM + Isolate Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() => Text(
                  'Computed Value 1: ${_viewModel.count1.value}',
                  style: TextStyle(fontSize: 24),
                )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _viewModel.incrementCount1,
              child: Text('Run Computation 1'),
            ),
            SizedBox(height: 40),
            Obx(() => Text(
                  'Computed Value 2: ${_viewModel.count2.value}',
                  style: TextStyle(fontSize: 24),
                )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _viewModel.incrementCount2,
              child: Text('Run Computation 2'),
            ),
          ],
        ),
      ),
    );
  }
}
