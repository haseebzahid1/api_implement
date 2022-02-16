import 'package:api_implement/model/MapLocation.dart';
import 'package:api_implement/repo/categorieItemRepo.dart';
import 'package:flutter/cupertino.dart';

class MapProvider extends ChangeNotifier{
  bool isServiceCalling= false;
  List<MapLocation> mapList = [];
  void getMap() async {
    isServiceCalling = false;
    var mapDataType = await CategoriesRepo.getMapData();
    if(mapDataType != null && mapDataType.isNotEmpty){
      mapList = mapDataType;
      isServiceCalling = true;
      notifyListeners();
    }
  }
}