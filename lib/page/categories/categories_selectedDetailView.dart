import 'package:api_implement/model/CategorieItem.dart';
import 'package:api_implement/style/constant.dart';
import 'package:api_implement/style/theme.dart';
import 'package:api_implement/widget.dart';
import 'package:flutter/material.dart';

class CategoriesDetailView extends StatefulWidget {
  CategoryItem data;
   CategoriesDetailView({Key? key,required this.data}) : super(key: key);

  @override
  State<CategoriesDetailView> createState() => _CategoriesDetailViewState();
}

class _CategoriesDetailViewState extends State<CategoriesDetailView> {
  @override
  int count = 1;
  double price = 249.0000;

  void increment(){
    setState(() {
      if(count> 1){
        count--;
      }
    });
  }

  void  decrement(){
    setState(() {
      count++;
    });
  }

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.grey,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.7,
              // child: Image.asset("assets/icons/image.png",fit: BoxFit.cover,),
              child: Image.network(widget.data.image!,fit: BoxFit.cover,),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  width: size.width,
                  height: size.height * 0.40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                    ),
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.data.title!,style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
                          SizedBox(height: size.height * 0.01,),
                          Text(widget.data.description!,style:  categoriesDetailViewTitle),
                          SizedBox(height: size.height * 0.01,),
                          Row(
                            children: [
                              Container(
                                width: size.width * 0.27,
                                height: size.height * 0.04,
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  color: Colors.lightBlue.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    countButton(
                                        size: size,
                                        text: '-',
                                        fontSize: 24,onTab:increment
                                    ),
                                    Text("${count}",style: TextStyle(fontSize: 17,color: kCustomButton,fontWeight: FontWeight.bold)),
                                    countButton(
                                        size: size,
                                        text: '+',
                                        fontSize:19,
                                        onTab:decrement
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: size.width * 0.02,),
                              GestureDetector(
                                  onTap: (){
                                    print("total");
                                  },
                                  child: Text("${(count*price).toStringAsFixed(1)}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:kCustomButton),)
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 10,
                        child: Column(
                          children: [
                            GestureDetector(
                                onTap: (){
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CheckOutPage()));
                                },
                                child: CustomButton(bgColor: kCustomButton, textButton: 'Order Now', width: size.width * 0.6, color: Colors.white,)
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector countButton({required Size size, required String text,required double fontSize,void Function()? onTab}){
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: size.width * 0.05,
        height: size.height * 0.05,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white
        ),
        child: Center(child: Text(text,style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.w500),)),
      ),
    );
  }
}
