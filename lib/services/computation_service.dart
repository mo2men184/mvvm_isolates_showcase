import 'dart:async';
import 'dart:isolate';

import 'package:get/get.dart';
import 'package:mvvm_isolates_showcase/models/computation_model.dart';

class ComputationService extends GetxService {
  Future<int> performComputation(ComputationModel model) async {
    ReceivePort receivePort = ReceivePort();
    Isolate isolate =
        await Isolate.spawn(_isolateEntry, [model, receivePort.sendPort]);
    int result = await receivePort.first;
    receivePort.close();
    isolate.kill();
    return result;
  }

  static void _isolateEntry(List<dynamic> message) {
    ComputationModel model = message[0];
    SendPort? sendPort = message[1];

    int result = 0;
    switch (model.type) {
      case 'computation1':
        result = _heavyComputation(model.value);
        break;
      case 'computation2':
        result = _anotherHeavyComputation(model.value);
        break;
      default:
        break;
    }

    sendPort?.send(result);
  }

  static int _heavyComputation(int value) {
    // Simulate heavy computation
    for (int i = 0; i < 1000000000; i++) {
      value += i;
    }
    return value;
  }

  static int _anotherHeavyComputation(int value) {
    // Simulate another heavy computation
    for (int i = 0; i < 500000000; i++) {
      value -= i;
    }
    return value;
  }
}
