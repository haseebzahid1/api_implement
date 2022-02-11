import 'package:api_implement/repo/categorieItemRepo.dart';
import 'package:flutter/material.dart';

class MenuItemProvider extends ChangeNotifier {
  void fetchMenuType() async {
    var menuType = await MenuItemRepo.getAllOrderTypes();

    print("Response is $menuType");

    for (var item in menuType) {
      print("${item.id} ${item.title}");
    }
  }
}
