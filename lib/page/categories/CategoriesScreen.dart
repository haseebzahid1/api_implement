import 'package:api_implement/page/subCategory/categories_listView.dart';
import 'package:api_implement/page/categories/provider/categoryProvider.dart';
import 'package:api_implement/style/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<MenuItemProvider>(
      create:(context)=>MenuItemProvider(),
      child:CategoriesScreenWidget(),
    );
  }
}

class CategoriesScreenWidget extends StatefulWidget {
  const CategoriesScreenWidget({Key? key}) : super(key: key);

  @override
  _CategoriesScreenWidgetState createState() => _CategoriesScreenWidgetState();
}

class _CategoriesScreenWidgetState extends State<CategoriesScreenWidget> {
  @override
  void initState(){
    final menuProvider = Provider.of<MenuItemProvider>(context, listen: false);
    menuProvider.fetchMenuType();
    super.initState();

  }
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuItemProvider>(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black.withOpacity(0.9)),
        actions:  [
          GestureDetector(
            onTap: (){
              print("Categories");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(menuProvider.menuList.length.toString(),style: categoriesCoinText),
                SizedBox(width: size.width * 0.01,),
                Container(
                  width: size.width * 0.06,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/icons/coin.png",),
                    radius: 50,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 10,)
        ],
      ),
      drawer:const Drawer(),
      body: menuProvider.isServiceCalling ? Column(
        children: [
          SizedBox(height: size.height * 0.02,),
          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              itemCount: menuProvider.menuList.length,
              // itemCount: categories.length,
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing:20,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                childAspectRatio: 0.97,
              ),
              itemBuilder: (context, index){
                var categoriesItem= menuProvider.menuList[index];
                // Categories categoriesItem= categories[index];
                return GestureDetector(
                  onTap: (){
                    print(categoriesItem.id);
                    // menuProvider.fetchCategory(categoriesItem.id);

                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SubCategoriesScreen(
                        id:categoriesItem.id,
                      )));

                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            spreadRadius: 2,
                            offset: Offset(-0.9,0),
                            color: Colors.grey.withOpacity(0.5),)
                        ]
                    ),
                    child: Column(
                      children:  [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(10),

                            ),

                            width: size.width,
                            child: Image.network(categoriesItem.image.toString())
                            // child: Image.asset(categoriesItem.image!,fit: BoxFit.cover,),
                          ),
                        ),
                        Padding(
                          padding:  const EdgeInsets.all(7.0),
                          child: Text(categoriesItem.title!,style: categoriesTitle,textAlign: TextAlign.center,),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ) : Center(child: CircularProgressIndicator())
    );
  }
}
