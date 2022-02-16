import 'package:api_implement/page/categories/CategoriesScreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'mapProvider.dart';
import 'package:provider/provider.dart';
class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MapProvider>(
      create:(context)=>MapProvider(),
      child:MapPageWidget(),
    );
  }
}




class MapPageWidget extends StatefulWidget {
  const MapPageWidget({Key? key}) : super(key: key);

  @override
  State<MapPageWidget> createState() => _MapPageState();
}

class _MapPageState extends State<MapPageWidget> {

  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(target: LatLng(25.6829929 , 55.7794104), zoom: 7.151926040649414,);
  static const CameraPosition _kLake =   CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(31.397841, 73.131817),
    tilt: 59.440717697143555,
    zoom: 10.151926040649414,
  );

  Future<void> _goToTheFaisalabad() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  @override
  void initState(){
    super.initState();
    final _provider = Provider.of<MapProvider>(context, listen: false);
    _provider.getMapData();
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
    final _provider = Provider.of<MapProvider>(context);
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _goToTheFaisalabad();
          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesScreen()));
        },
        child: const Icon(Icons.where_to_vote),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text("map"),
      ),
      body:_provider.isServiceCalling?GoogleMap(
          mapType: MapType.terrain,
          initialCameraPosition:_kGooglePlex,
          markers: Set.of(_provider.markerList),
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          }
      ):const Center(child: CircularProgressIndicator(),),
    );
  }

}