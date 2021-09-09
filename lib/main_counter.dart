import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetup_getx/counter/navigation.dart';

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
