import 'package:api_implement/model/MapLocation.dart';
import 'package:api_implement/repo/categorieItemRepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProvider extends ChangeNotifier{
  bool isServiceCalling= false;
  List<MapLocation> mapList = [];
  List<Marker> markerList = [];
  void getMapData() async {
    isServiceCalling = false;
    var mapData = await CategoriesRepo.fetchMapData();
    if(mapData != null && mapData.isNotEmpty){
      mapList = mapData;



      for(int i=0;i<mapData.length;i++){
        markerList.add(
            Marker(
            markerId: MarkerId("${mapData[i].id}"),
              position: LatLng(mapData[i].latitude!,mapData[i].longitude!),
              infoWindow: InfoWindow(
                title: mapData[i].title,
                snippet: mapData[i].phone,
              ),
              icon:await BitmapDescriptor.fromAssetImage(
                ImageConfiguration(devicePixelRatio: 2.5), 'assets/icons/marker.png') ,
            )
        );
      }
      // Marker(
      //   markerId:  MarkerId('id-1'),
      //   position:  LatLng(31.411930 , 73.108047),
      //   infoWindow:  InfoWindow(
      //       title: "title",
      //       snippet: 'A title place'
      //   ),
      // )






      isServiceCalling = true;
      notifyListeners();
    }
  }
}