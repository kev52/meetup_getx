import 'package:get/get.dart';
import 'user.dart';

class AuthService extends GetxService {
  Rx<User> user = User().obs;

  void login() async {
    await 2.delay();
    user.value = AuthenticatedUser('12345', 'Kevin');
  }
}

mixin AuthProvider {
  AuthService get _service => Get.find();

  Rx<User> get user => _service.user;

  void login() {
    _service.login();
  }
}
