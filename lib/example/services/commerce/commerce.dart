import 'package:get/get.dart';

class CommerceService extends GetxService {
  Map<String, double> _prices = {
    '12345': 1250.95,
    '54321': 1365.95,
    '13579': 1560.95,
  };

  double getPrice(String identifier) {
    return _prices[identifier]!;
  }
}

mixin CommerceProvider {
  CommerceService get pricing => Get.find();

  double getPrice(String identifier) => pricing.getPrice(identifier);
}
