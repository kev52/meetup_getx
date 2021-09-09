import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_controller.dart';

class CounterCard extends GetView<CounterController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: InkWell(
        onTap: controller.onNavigation,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => controller.counter--,
                    icon: Icon(Icons.remove)),
                Obx(() => Text('${controller.counter.value}')),
                IconButton(
                    onPressed: () => controller.counter++,
                    icon: Icon(Icons.add)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
