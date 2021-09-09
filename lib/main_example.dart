import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetup_getx/example/services/auth/auth.dart';
import 'package:meetup_getx/example/services/commerce/commerce.dart';
import 'package:meetup_getx/example/services/marketing/marketing.dart';
import 'package:meetup_getx/example/services/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
      initialBinding: ServiceBindings(),
    );
  }
}

class ServiceBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MarketingService());
    Get.lazyPut(() => CommerceService());
    Get.lazyPut(() => AuthService());
    Get.lazyPut(() => HomeController());
  }
}
