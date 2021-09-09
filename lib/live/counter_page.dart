import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_controller.dart';

class CounterPage extends GetView<CounterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Obx(() => Column(
                  children: [
                    Text(
                      '${controller.counter}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                )),
            TextButton(
                onPressed: () {
                  Get.snackbar(
                    "Default SnackBar",
                    "This is the Getx default SnackBar",
                  );
                },
                child: Text('SNACK ME')),
            TextButton(onPressed: () {}, child: Text('PRINT ME'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.counter++,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
