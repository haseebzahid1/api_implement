import 'dart:convert';
import 'dart:io';
import 'package:api_implement/model/category.dart';
import 'package:http/http.dart' as http;


class CategoriesRepo {
  static Future<List<CategoryMenuType>> getAllOrderTypes() async {
    var client = http.Client();
    String baseUrl = "phplaravel-438875-2225426.cloudwaysapps.com";
    var url = Uri.https(
        baseUrl, '/api/v1/categories', {"branch_id": "1", "menu_type_id": "1"}
        );
    List<CategoryMenuType> menuType = [];
    var response = await client.get(url);
    try{
      if(response.statusCode == 200){
        var resData = jsonDecode(response.body);
        for(int i=0;i<resData["data"].length;i++){
          CategoryMenuType menutType = CategoryMenuType.fromJson(
            resData["data"][i]
          );
          menuType.add(menutType);
        }
        return menuType;
      }
    return menuType;
    }on SocketException catch (_) {
      print('Internet not connected');
    }catch(e){
      print("Api fail");
      print(e);
    }
    return menuType;
  }
}
