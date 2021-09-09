import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetup_getx/live/navigation.dart';

void main() {
  Get.put(NavigationService());
  runApp(MyApp());
}

class MyApp extends StatelessWidget with NavigationProvider {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: pages,
      initialRoute: home,
    );
  }
}

class CounterController extends GetxController {
  final String title = 'Meetup GetX Session';
  RxInt counter = 0.obs;
}

class CounterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CounterController());
  }
}

class CounterPage extends GetView<CounterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Obx(() => Text(
                  '${controller.counter}',
                  style: Theme.of(context).textTheme.headline4,
                )),
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
