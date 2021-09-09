import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter.dart';

class CountersController extends GetxController {
  final List<int> indizes = [0, 1, 2];

  @override
  void onInit() {
    indizes.forEach((element) {
      Get.put(CounterController(), tag: element.toString());
    });
    super.onInit();
  }
}

class CountersBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CountersController());
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
          children: controller.indizes
              .map((e) => CounterCard(
                    tag: e.toString(),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
