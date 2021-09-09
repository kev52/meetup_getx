import 'package:get/get.dart';

class ProductModel {
  final String identifier;
  final String name;

  ProductModel(this.identifier, this.name);
}

class MarketingService extends GetxService {
  Map<String, String> _products = {
    '12345': 'iPhone X',
    '54321': 'iPhone Y',
    '13579': 'iPhone Z',
  };

  List<ProductModel> getProducts() {
    return _products.entries.map((e) => ProductModel(e.key, e.value)).toList();
  }
}

mixin MarketingProvider {
  MarketingService get service => Get.find();

  List<ProductModel> get products => service.getProducts();
}
