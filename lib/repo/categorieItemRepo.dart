import 'dart:convert';
import 'dart:io';
import 'package:api_implement/model/CategorieItem.dart';
import 'package:api_implement/model/MapLocation.dart';
import 'package:api_implement/model/category.dart';
import 'package:http/http.dart' as http;

class CategoriesRepo {

  static Future<List<CategoryMenuType>> getAllOrderTypes() async {
    var client = http.Client();
    String baseUrl = "phplaravel-438875-2225426.cloudwaysapps.com";
    var url  = Uri.https(baseUrl, '/api/v1/categories', {"branch_id": "1", "menu_type_id": "1"});
    List<CategoryMenuType> menuType = [];
    var response = await client.get(url);
   try{
     if(response.statusCode == 200){
       var resData = jsonDecode(response.body);
       for(int i=0;i<resData["data"].length;i++){
         CategoryMenuType menuTypee = CategoryMenuType.fromJson(resData["data"][i]);
         menuType.add(menuTypee);
       }
       return menuType;
     }
     return menuType;
   }on SocketException catch (_) {
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
    print(id);
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


  // Map location

  static Future<List<MapLocation>> fetchMapData() async {
    var client = http.Client();
    String baseUrl = "phplaravel-438875-2225426.cloudwaysapps.com";
    var url = Uri.https(baseUrl, '/api/v1/branches', {"menu_type_id": "1",});
    List<MapLocation> mapList = [];
    var response = await client.get(url);
    try{
      if(response.statusCode == 200){
        var resData = jsonDecode(response.body);
        for(int i=0;i<resData["data"].length;i++){
          MapLocation dataItem = MapLocation.fromJson(resData["data"][i]);
          mapList.add(dataItem);
        }
        return mapList;
      }
      return mapList;
    }on SocketException catch (_) {
      print('Internet not connected');
    }  finally {
      client.close();
    }
    return mapList;
  }

} //CategoriesRepo
