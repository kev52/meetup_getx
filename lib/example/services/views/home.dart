import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetup_getx/example/services/auth/auth.dart';
import 'package:meetup_getx/example/services/auth/user.dart';

import 'products.dart';

class HomeController extends GetxController
    with StateMixin<User>, AuthProvider {
  @override
  void onInit() {
    ever(user, (User user) {
      if (user is AuthenticatedUser) {
        Get.put(ProductsController());
        Get.put(PurchaseController());
      }
      change(user, status: RxStatus.success());
    });

    change(user.value, status: RxStatus.success());

    super.onInit();
  }

  void onLogin() {
    change(user.value, status: RxStatus.loading());
    login();
  }
}

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
      ),
      body: controller.obx(
        (user) {
          if (user is AuthenticatedUser) return ProductsView();

          return LoginView();
        },
        onLoading: Center(child: CircularProgressIndicator.adaptive()),
        onEmpty: Container(),
        onError: (error) => Text('Something went wrong: $error'),
      ),
    );
  }
}

class LoginView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: controller.onLogin,
        child: Text('Login'),
      ),
    );
  }
}

class SubscribedView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Subscribed'),
    );
  }
}
