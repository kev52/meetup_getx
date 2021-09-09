import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetup_getx/live/counter_argument.dart';

import 'navigation.dart';

class CounterController extends GetxController with NavigationProvider {
  final String name = 'Meetup GetX Example';
  RxInt counter = 0.obs;

  @override
  void onInit() {
    ever(counter, (value) {
      print('ALWAYS PRINT $value');
    });

    //everAll(listeners, callback);

    //debounce(listener, callback);

    //interval(listener, callback)

    once(counter, (value) {
      print('ONCE CALLED PRINT $value');
    });

    super.onInit();
  }

  void onClick(String index) {
    navigateTo(NavigationRoute.counter, CounterArgument(index));
  }
}

class CounterBindings extends Bindings {
  @override
  void dependencies() {}
}

class CounterCard extends GetView<CounterController> {
  @override
  final String tag;

  const CounterCard({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: InkWell(
        onTap: () => controller.onClick(tag),
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

class CounterPage extends GetView<CounterController> {
  @override
  final String tag;

  CounterPage() : tag = (Get.arguments as CounterArgument).index;

  void printArgument() {
    print(Get.arguments);
  }

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
              'You have pushed the button of counter $tag this many times:',
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
            TextButton(onPressed: printArgument, child: Text('PRINT ME'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.counter++,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
