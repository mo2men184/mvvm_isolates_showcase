import 'package:get/get.dart';
import 'package:mvvm_isolates_showcase/models/computation_model.dart';
import 'package:mvvm_isolates_showcase/services/computation_service.dart';

class HomeViewModel extends GetxController {
  final computationService = Get.find<ComputationService>();

  final count1 = 0.obs;
  final count2 = 0.obs;

  void incrementCount1() async {
    int result = await computationService
        .performComputation(ComputationModel('computation1', count1.value));
    count1.value = result;
  }

  void incrementCount2() async {
    int result = await computationService
        .performComputation(ComputationModel('computation2', count2.value));
    count2.value = result;
  }
}
