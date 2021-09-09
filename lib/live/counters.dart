import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_card.dart';
import 'counter_controller.dart';

class CountersController extends GetxController {
  final List<int> indizes = [0, 1, 2];

  @override
  void onInit() {
    super.onInit();
  }
}

class CountersBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CountersController());
    Get.put(CounterController());
  }
}

class CountersPage extends GetView<CountersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Counters'),
      ),
      body: SingleChildScrollView(
        child: ListBody(
          children: controller.indizes.map((e) => CounterCard()).toList(),
        ),
      ),
    );
  }
}
