import 'dart:convert';
import 'dart:io';
import 'package:api_implement/model/CategorieItem.dart';
import 'package:api_implement/model/category.dart';
import 'package:http/http.dart' as http;

class CategoriesRepo {

  // Get All Categories ...
  static Future<List<CategoryMenuType>> getAllOrderTypes() async {
    var client = http.Client();
    String baseUrl = "phplaravel-438875-2225426.cloudwaysapps.com";
    var url = Uri.https(
        baseUrl, '/api/v1/categories', {"branch_id": "1", "menu_type_id": "1"});
    List<CategoryMenuType> menuType = [];
    var response = await client.get(url);
    try {
      if (response.statusCode == 200) {
        var resData = jsonDecode(response.body);
        for (int i = 0; i < resData["data"].length; i++) {
          CategoryMenuType menutType =
              CategoryMenuType.fromJson(resData["data"][i]);
          menuType.add(menutType);
        }
        return menuType;
      }
      return menuType;
    } on SocketException catch (_) {
      print('Internet not connected');
    }  finally {
      client.close();
    }
    return menuType;
  }

  //Get Single Category Item
  static Future<List<CategoryItem>> getCategory(int? id) async {
    var client = http.Client();
    String baseUrl = "phplaravel-438875-2225426.cloudwaysapps.com";

    var url = Uri.https(baseUrl, '/api/v1/menu',
        {"menu_type_id": "1", "branch_id": "1", "category_id": "$id"});
    var response = await client.get(url);
    print(url);
    List<CategoryItem> categoryList = [];
   try{
     if (response.statusCode == 200) {
       var data = jsonDecode(response.body);
       for(int i=0; i<data["data"].length;i++){
         CategoryItem item = CategoryItem.fromJson(data["data"][i]);
         categoryList.add(item);
       }
       return categoryList;
     }
     return categoryList;
   }on SocketException catch (_) {
     print('Internet not connected');
   }  finally {
     client.close();
   }
   return categoryList;
  }



} //CategoriesRepo
