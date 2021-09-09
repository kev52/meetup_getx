import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetup_getx/counter/counter.dart';
import 'package:meetup_getx/counter/counters.dart';

enum NavigationRoute { counters, counter }

extension Details on NavigationRoute {
  String get name {
    switch (this) {
      case NavigationRoute.counters:
        return '/counters';
      case NavigationRoute.counter:
        return '/counters/counter';
      default:
        return '/';
    }
  }

  Widget get page {
    switch (this) {
      case NavigationRoute.counters:
        return CountersPage();
      case NavigationRoute.counter:
        return CounterPage();
      default:
        return Container();
    }
  }

  Bindings? get binding {
    switch (this) {
      case NavigationRoute.counters:
        return CountersBindings();
      case NavigationRoute.counter:
        return CounterBindings();
      default:
        return null;
    }
  }
}

class NavigationService extends GetxService {
  List<GetPage> get pages => NavigationRoute.values
      .map((route) => GetPage(
            name: route.name,
            page: () => route.page,
            binding: route.binding,
          ))
      .toList();
}

mixin NavigationProvider {
  List<GetPage> get pages => Get.find<NavigationService>().pages;

  navigateTo(NavigationRoute route, dynamic arguments) {
    Get.toNamed(route.name, arguments: arguments);
  }

  String get home => NavigationRoute.counters.name;
}
