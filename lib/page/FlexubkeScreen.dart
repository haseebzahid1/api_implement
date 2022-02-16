import 'package:api_implement/model/MapLocation.dart';
import 'package:api_implement/page/map/mapProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../style/constant.dart';

class FlexibleScreen extends StatelessWidget {
  const FlexibleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MapProvider>(
      create:(context)=>MapProvider(),
      child:FlexibleScreenWidget(),
    );
  }
}



class FlexibleScreenWidget extends StatefulWidget {
  const FlexibleScreenWidget({Key? key}) : super(key: key);

  @override
  State<FlexibleScreenWidget> createState() => _FlexibleScreenWidgetState();
}

class _FlexibleScreenWidgetState extends State<FlexibleScreenWidget> {
  initState(){
    final _provider = Provider.of<MapProvider>(context, listen: false);
    _provider.getMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final _provider = Provider.of<MapProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("api implement"),
      ),
      body:_provider.isServiceCalling? Column(
        children: [
      Flexible(child: ListView.builder(
      shrinkWrap: true,
      itemCount: _provider.mapList.length,
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        itemBuilder: (context, index){
          MapLocation _item = _provider.mapList[index];
          return GestureDetector(
            onTap: (){
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesDetailView(
              //     data:_item
              // )));
            },
            child: Container(
              width: size.width,
              margin: EdgeInsets.only(top: 10),
              // color: Colors.red,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: size.width * 0.02,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${_item.title}",style: categoriesTitle.copyWith(fontSize: 19)),
                              SizedBox(height: size.height * 0.01,),
                              Text(_item.address!,style: categoriesListSubTitle,),
                              SizedBox(height: size.height * 0.01,),
                              Text("${_item.cityId} DH",style: detailZeroText.copyWith(fontSize: 17,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },),
      ),
          Center(
            child: Text("${_provider.mapList.length}",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
          ),
        ],
      ):Center(child: CircularProgressIndicator()),
    );
  }
}
