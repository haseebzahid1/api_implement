import 'package:api_implement/page/categories/CategoriesScreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(target: LatLng(31.411930 , 73.108047), zoom: 14.151926040649414,);

  static const CameraPosition _kLake =   CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(31.411930 , 73.108047),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  Future<void> _goToTheFaisalabad() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  @override
  void initState(){
    super.initState();
    marker.addAll(_list);
  }

   List<Marker> marker = [];

   final List<Marker> _list  = [
     const Marker(
      markerId:  MarkerId('id-1'),
      position:  LatLng(31.411930 , 73.108047),
      infoWindow:  InfoWindow(
          title: "title",
          snippet: 'A title place'
      ),
    ),
      const Marker(
      markerId:  MarkerId('id-2'),
      position:  LatLng(31.411930 , 73.115047),
      infoWindow:  InfoWindow(
          title: "title-2",
          snippet: 'A title place_2',
      ),
    ),
      const Marker(
       markerId: MarkerId('id-1'),
       position: LatLng(31.411930 , 73.098047),
       infoWindow: InfoWindow(
           title: "title",
           snippet: 'A title place'
       ),
     ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _goToTheFaisalabad();
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesScreen()));
        },
        child: const Icon(Icons.where_to_vote),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text("map"),
      ),
      body:GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition:_kGooglePlex,
        markers: Set.of(marker),
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        }
      ),
    );
  }

}
