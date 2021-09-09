import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetup_getx/example/services/commerce/commerce.dart';
import 'package:meetup_getx/example/services/marketing/marketing.dart';

class ProductsController extends GetxController
    with MarketingProvider, CommerceProvider {
  final RxList<ProductModel> _products = <ProductModel>[].obs;

  @override
  void onInit() {
    _products.value = products;
    super.onInit();
  }

  int get productsCount => _products.length;
  ProductModel model(int index) => _products[index];
}

class ProductsView extends GetView<ProductsController> {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: ListBody(children: [
            ...controller.products
                .map((e) => ProductListItem(model: e))
                .toList(),
            CartView(),
          ]),
        ));
  }
}

class ProductListItem extends GetView<ProductsController> {
  final ProductModel model;

  const ProductListItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(model.name),
          PurchaseButton(model.identifier),
        ],
      ),
    );
  }
}

class PurchaseController extends GetxController with CommerceProvider {
  Map<String, int> _cart = {};
  RxDouble total = 0.0.obs;

  String price(String identifier) => getPrice(identifier).toString();

  void addToCart(String identifier) {
    _cart[identifier] = (_cart[identifier] ?? 0) + 1;
    _calculateTotal();
    Get.snackbar(
        'Erfolgreich', 'Produkt erfolgreich zum Warenkorb hinzugefügt.',
        snackPosition: SnackPosition.BOTTOM);
  }

  void _calculateTotal() {
    total.value = _cart.entries.fold(0.0, (previousValue, entry) {
      final price = getPrice(entry.key);

      return previousValue + entry.value * price;
    });
  }
}

class PurchaseButton extends GetView<PurchaseController> {
  final String identifier;

  const PurchaseButton(this.identifier, {Key? key}) : super(key: key);
  String get price => controller.price(identifier);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => controller.addToCart(identifier), child: Text(price));
  }
}

class CartView extends GetView<PurchaseController> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total:', style: Theme.of(context).textTheme.headline6),
          Obx(() => Text('${controller.total}',
              style: Theme.of(context).textTheme.headline6)),
        ],
      ),
    );
  }
}
