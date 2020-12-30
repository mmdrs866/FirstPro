import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test_market/Model/Boxes.dart';
import 'package:test_market/Model/Category.dart';
import 'package:test_market/Model/Product.dart';
import 'package:test_market/Model/Shop.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:test_market/screens/Shop_Solo_Screen.dart';
import 'home_screen.dart';

class Shop_Screen extends StatefulWidget {
  @override
  _Shop_ScreenState createState() => _Shop_ScreenState();
}

class _Shop_ScreenState extends State<Shop_Screen> {

  int _selectedIndextab0 = 0;
  int _selectedIndextab1 = 0;
  List<Shop> shops_cake = [];
  List<Shop> shops_coffee = [];

  @override
  Widget build(BuildContext context) {


    List<String> iconlist= ["http://192.168.43.159/flutter_app1/Logo/icons_cake.png","http://192.168.43.159/flutter_app1/Logo/icons_tar.png","http://192.168.43.159/flutter_app1/Logo/icons_khoshk.png","http://192.168.43.159/flutter_app1/Logo/icons_donat.png","http://192.168.43.159/flutter_app1/Logo/icons_finger.png","http://192.168.43.159/flutter_app1/Logo/icons_shokolat.png"];

if(shops_cake.length==0)
{
  shops_cake.add(new Shop(title:"index 0 upper",img_url:"",id: 0, icons: iconlist ,shopcategory: 2 ));
    shops_cake.add(new Shop(title:"کانتینر",img_url:"http://192.168.43.159/flutter_app1/Shops/kantiner.png",id: 1, icons: iconlist ,shopcategory: 0 ));
    shops_cake.add(new Shop(title:"مهدیان",img_url:"http://192.168.43.159/flutter_app1/Shops/mahdian.png",id: 2, icons: iconlist ,shopcategory: 0));
    shops_cake.add(new Shop(title:"ناب",img_url:"http://192.168.43.159/flutter_app1/Shops/nab.png",id: 3,shopcategory: 0, icons: ["http://192.168.43.159/flutter_app1/Logo/icons_khoshk.png","http://192.168.43.159/flutter_app1/Logo/icons_donat.png","http://192.168.43.159/flutter_app1/Logo/icons_finger.png","http://192.168.43.159/flutter_app1/Logo/icons_shokolat.png",] ));
    shops_cake.add(new Shop(title:"کافه قنادی روشا",img_url:"http://192.168.43.159/flutter_app1/Shops/rosha.png",id: 4,shopcategory: 2, icons: iconlist ));
    shops_cake.add(new Shop(title:"روشا",img_url:"http://192.168.43.159/flutter_app1/Shops/rosha.png",id: 5,shopcategory: 0, icons: iconlist ));
    shops_cake.add(new Shop(title:"نیشکر",img_url:"http://192.168.43.159/flutter_app1/Shops/neyshekar.png",id: 6,shopcategory: 0, icons: iconlist ));
    shops_cake.add(new Shop(title:"کافه نیشکر",img_url:"http://192.168.43.159/flutter_app1/Shops/neyshekar.png",id: 7,shopcategory: 1, icons: iconlist ));
    shops_cake.add(new Shop(title:"کافه سالی‌",img_url:"http://192.168.43.159/flutter_app1/Shops/sali.png",id: 8, icons: iconlist ,shopcategory: 1 ));
    shops_cake.add(new Shop(title:"لندو",img_url:"http://192.168.43.159/flutter_app1/Shops/lendo.png",id: 9,shopcategory: 0, icons: iconlist ));}

int removecounter = 0;
    print(shops_cake.length);
for(int i=0;i<shops_cake.length;i++){
  i=i-removecounter;
  if(shops_cake[i].shopcategory>0){
    shops_coffee.add(shops_cake[i]);
    if(shops_cake[i].shopcategory==1){
      shops_cake.removeAt(i);
      removecounter+=1;
      // print(shops_cake[i].title+" removed");
    }
    if(shops_cake[i].shopcategory==2){
      shops_cake[i].shopcategory=0;
      // print(shops_cake[i].title+" changed");
    }
  }
}
// print(shops_cake.length);
// print(shops_coffee.length);


    return Scaffold(

      body: Column(
        children: <Widget>[

          Container(height: 100,),
          DefaultTabController(
              length: 2, // length of tabs
              initialIndex: 0,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                Container(
                  child: TabBar(
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(text: 'قنادی'),
                      Tab(text: 'کافیشاپ'),
                    ],
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height-kBottomNavigationBarHeight-165, //height of TabBarView
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey, width: 0.5),),
                    ),
                    child: TabBarView(children: <Widget>[
                      MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: StaggeredGridView.countBuilder(
                            crossAxisCount: 6,
                            itemBuilder: ShopListtab0,
                            itemCount: shops_cake.length,
                            staggeredTileBuilder: (index) => StaggeredTile.count((index==0?6:3), (index==0?5:5))
                        ),),
                      ),
                      Container(
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child : Container(
                              margin: EdgeInsets.only(top: 20),
                              child: StaggeredGridView.countBuilder(
                                  crossAxisCount: 6,
                                  itemBuilder: ShopListtab1,
                                  itemCount: shops_coffee.length,
                                  staggeredTileBuilder: (index) => StaggeredTile.count((index==0?6:3), (index==0?5:5))
                              ),)))

                    ])
                )
              ])
          ),
        ],
      ),
    );
  }




  Widget HomeCategoryListtab0(BuildContext context, int index) {
    return IndexHomeCategory(context,index, category_shirini,0);
  }
  Widget HomeCategoryListtab1(BuildContext context, int index) {
    return IndexHomeCategory(context,index, category_coffee,1);
  }

  Widget IndexHomeCategory(BuildContext context, int index , List<Category> list ,int tab){

    return Column(
      children: <Widget>[

        GestureDetector(
            child: Container(
              width: 100, height: 170, margin: EdgeInsets.only(left: 3, top: 0, bottom: 5,right: 13),
              decoration: BoxDecoration(border: Border.all(color: Color(0xffF1E6DD), width: 5), color: ((_selectedIndextab0 != null && (tab==0?_selectedIndextab0:_selectedIndextab1) == index) ? Color(0xffF1E6DD): Colors.white24), borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(children: <Widget>[


                Container(margin:EdgeInsets.only(left: 3,right: 3),child: Image(image: NetworkImage(list[index].img), height: 100,)),

                Container(child: Center(child: Text(list[index].title,style: TextStyle(fontSize: 17,),)),alignment: Alignment(0.75, 0),),

              ],),
            ),
            onTap: () => _onSelected(index,tab)),

        _selectedIndextab0 != null && ((tab==0?_selectedIndextab0:_selectedIndextab1) == index) ? Container(width:90,margin: EdgeInsets.only(right: 10),child: Center(child: Image(image: NetworkImage("http://192.168.43.159/flutter_app1/Logo/pointer.png"),),),) : Text(""),

      ],
    );
  }_onSelected(int index,int tab) {setState(() {if(tab==0){_selectedIndextab0=index;}else{_selectedIndextab1=index;};print(_selectedIndextab0.toString());});}


  Widget ShopListtab0(BuildContext context, int index) { return ShopList(context,index,0);}
  Widget ShopListtab1(BuildContext context, int index) { return ShopList(context,index,1);}

  Widget ShopList(BuildContext context, int index, int tab) {
    if(index==0) return Category_Store_Widget(tab);

    if(tab==0){return indexProductView(context,index, shops_cake , tab);}
    if(tab==1){return indexProductView(context,index, shops_coffee , tab);}
  }

  Widget indexProductView(context,int index, List<Shop> list, int tab) {



    return GestureDetector(child:Container(
      child: Stack(children: <Widget>[




        Container(width: 200, height: 300, margin: EdgeInsets.only(left : 5, right : 5,top: 57, bottom: 12),
          decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey[400], width: 0.3), color: Color(0xffDFEEFF), borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(children: <Widget>[

            Container(height: 65,),
            Container(child: Text(list[index].title,style: TextStyle(fontSize: 17,),),alignment: Alignment(0.75, 0),),
            Divider(endIndent: 10,indent: 10),

            tab==0?Icons_List_Storetab0(shops_cake[index].icons):Text(""),
            tab==1?Icons_List_Storetab1(shops_coffee[index].icons):Text(""),

            Divider(endIndent: 10,indent: 10),
            Container(width: 120, child: Text("4.5", style: TextStyle(color: Colors.blueGrey , fontWeight: FontWeight.bold),),alignment: Alignment.bottomLeft,),

          ],
          ),
        ),
        Container(alignment : Alignment.topCenter,child: Image(image: NetworkImage(list[index].img_url), height: 120)),

      ],),
    )

      ,onTap: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> Shop_Solo_Screen(list[index].id)));print(list[index].title);});
  }

  Icons_List_Storetab0(List<String> list){

    return Container(
      alignment: Alignment.topRight,
        height: 80,
        width: 100,
        child: StaggeredGridView.countBuilder(

            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            itemBuilder: IconListtab0,
            itemCount: list.length,
            staggeredTileBuilder: (index) => StaggeredTile.count(1,1)
        )
    );
  }
  Icons_List_Storetab1(List<String> list){

    return Container(
      alignment: Alignment.topRight,
        height: 80,
        width: 100,
        child: StaggeredGridView.countBuilder(

            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            itemBuilder: IconListtab1,
            itemCount: 4,
            staggeredTileBuilder: (index) => StaggeredTile.count(1,1)
        )
    );
  }

  
  Widget IconListtab0(BuildContext context, int index) {
    return IconView(context,index, shops_cake[index].icons);
  }
  Widget IconListtab1(BuildContext context, int index) {
    return IconView(context,index, shops_coffee[index].icons);
  }


  Widget IconView(context , index , List<String> list){

    // print(list.length.toString()+"    "+index.toString());
    return Image(image: NetworkImage(list[index]));
  }



  Category_Store_Widget(int tab){

    return Container(
      child: Column(children: <Widget>[


        tab==0
         ? category_shirini.length > 0
              ? (Container(
                  child: ListView.builder(
                    itemBuilder: HomeCategoryListtab0,
                    itemCount: category_shirini.length,
                    scrollDirection: Axis.horizontal,
                  ),height: 225,))

              : (Container(child: Center(child: CircularProgressIndicator(),), height: 225,))
        : category_coffee.length > 0
             ? (Container(
                  child: ListView.builder(
                    itemBuilder: HomeCategoryListtab1,
                    itemCount: category_coffee.length,
                    scrollDirection: Axis.horizontal,
                  ),height: 225,))

            : (Container(child: Center(child: CircularProgressIndicator(),), height: 225,)),


        _selectedIndextab0 != null ?
        Container(
            color: Colors.yellow[100],
            height: 100,
            child: Column(
              children: <Widget>[
                Container(child: Text("  دستبندی :" +( tab==0?(category_shirini[_selectedIndextab0].title):(category_coffee[_selectedIndextab1].title)) , style: TextStyle(fontSize: 24)),margin: EdgeInsets.only(top: 7),alignment: Alignment.centerRight,),
                Container(child: Text("  تعداد فروشگاه‌های دارای" + ( tab==0?(category_shirini[_selectedIndextab0].title):(category_coffee[_selectedIndextab1].title)) +" : 7 "  , style: TextStyle(fontSize: 17)),alignment: Alignment.centerRight),

              ],
            ),alignment: Alignment.centerRight)
            : Text("") ,
      ]),
    );
  }





}

