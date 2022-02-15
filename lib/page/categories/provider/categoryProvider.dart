import 'package:api_implement/model/category.dart';
import 'package:api_implement/repo/categorieItemRepo.dart';
import 'package:flutter/material.dart';

class MenuItemProvider extends ChangeNotifier {
  List<CategoryMenuType>  menuList = [];
  bool isServiceCalling= false;
    int? itemsLength;

  void fetchMenuType() async {
    isServiceCalling = false;
    var menuType = await CategoriesRepo.getAllOrderTypes();
    if(menuType != null && menuType.isNotEmpty) {
      menuList = menuType;
      isServiceCalling = true;
      itemsLength = menuType.length;
      notifyListeners();
    }

    // print("Response is $menuType");
    //
    // for (CategoryMenuType item in menuType) {
    //   print("${item.id} \n ${item.title} \n${item.description}\n ${item.image}");
    // }
    }

}
