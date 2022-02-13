import 'package:api_implement/model/CategorieItem.dart';
import 'package:api_implement/repo/categorieItemRepo.dart';
import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier{

  List<CategoryItem>  categoryList = [];
  bool isServiceCalling= false;

  void fetchCategory(int? id) async {
    isServiceCalling =false;
    if(id != null){
      var data = await CategoriesRepo.getCategory(id);
      if(data != null && data.isNotEmpty){
        categoryList = data;
        isServiceCalling = true;
        notifyListeners();
      }
      // print("Response is $data  null");
      // for(var itemm in data){
      //   print("${itemm.id} \n ${itemm.choices} ok");
      // }

    }
  }
}