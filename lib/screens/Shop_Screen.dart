import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test_market/Model/Category.dart';
import 'package:test_market/Model/Shop.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:test_market/screens/Shop_Solo_Screen.dart';
import 'home_screen.dart';

class Shop_Screen extends StatefulWidget {
  @override
  _Shop_ScreenState createState() => _Shop_ScreenState();
}

class _Shop_ScreenState extends State<Shop_Screen> {

  int _selectedIndex = 1;
  List<Shop> Shops = [];

  @override
  Widget build(BuildContext context) {



    Shops.add(new Shop(title:"کانتینر",img_url:"http://192.168.43.159/flutter_app1/Shops/kantiner.png",id: 1, icons: ["http://192.168.43.159/flutter_app1/Logo/icons_cake.png","http://192.168.43.159/flutter_app1/Logo/icons_tar.png","http://192.168.43.159/flutter_app1/Logo/icons_khoshk.png","http://192.168.43.159/flutter_app1/Logo/icons_donat.png","http://192.168.43.159/flutter_app1/Logo/icons_finger.png","http://192.168.43.159/flutter_app1/Logo/icons_shokolat.png",] ));
    Shops.add(new Shop(title:"مهدیان",img_url:"http://192.168.43.159/flutter_app1/Shops/mahdian.png",id: 2, icons: ["http://192.168.43.159/flutter_app1/Logo/icons_cake.png","http://192.168.43.159/flutter_app1/Logo/icons_tar.png","http://192.168.43.159/flutter_app1/Logo/icons_khoshk.png","http://192.168.43.159/flutter_app1/Logo/icons_donat.png","http://192.168.43.159/flutter_app1/Logo/icons_finger.png","http://192.168.43.159/flutter_app1/Logo/icons_shokolat.png",] ));
    Shops.add(new Shop(title:"ناب",img_url:"http://192.168.43.159/flutter_app1/Shops/nab.png",id: 3, icons: ["http://192.168.43.159/flutter_app1/Logo/icons_khoshk.png","http://192.168.43.159/flutter_app1/Logo/icons_donat.png","http://192.168.43.159/flutter_app1/Logo/icons_finger.png","http://192.168.43.159/flutter_app1/Logo/icons_shokolat.png",] ));
    Shops.add(new Shop(title:"روشا",img_url:"http://192.168.43.159/flutter_app1/Shops/rosha.png",id: 4, icons: ["http://192.168.43.159/flutter_app1/Logo/icons_cake.png","http://192.168.43.159/flutter_app1/Logo/icons_tar.png","http://192.168.43.159/flutter_app1/Logo/icons_khoshk.png","http://192.168.43.159/flutter_app1/Logo/icons_donat.png","http://192.168.43.159/flutter_app1/Logo/icons_finger.png","http://192.168.43.159/flutter_app1/Logo/icons_shokolat.png",] ));
    Shops.add(new Shop(title:"نیشکر",img_url:"http://192.168.43.159/flutter_app1/Shops/neyshekar.png",id: 5, icons: ["http://192.168.43.159/flutter_app1/Logo/icons_cake.png","http://192.168.43.159/flutter_app1/Logo/icons_tar.png","http://192.168.43.159/flutter_app1/Logo/icons_khoshk.png","http://192.168.43.159/flutter_app1/Logo/icons_donat.png","http://192.168.43.159/flutter_app1/Logo/icons_finger.png","http://192.168.43.159/flutter_app1/Logo/icons_shokolat.png",] ));
    Shops.add(new Shop(title:"سالی‌",img_url:"http://192.168.43.159/flutter_app1/Shops/sali.png",id: 6, icons: ["http://192.168.43.159/flutter_app1/Logo/icons_cake.png","http://192.168.43.159/flutter_app1/Logo/icons_tar.png","http://192.168.43.159/flutter_app1/Logo/icons_khoshk.png","http://192.168.43.159/flutter_app1/Logo/icons_donat.png","http://192.168.43.159/flutter_app1/Logo/icons_finger.png","http://192.168.43.159/flutter_app1/Logo/icons_shokolat.png",] ));
    Shops.add(new Shop(title:"لندو",img_url:"http://192.168.43.159/flutter_app1/Shops/lendo.png",id: 7, icons: ["http://192.168.43.159/flutter_app1/Logo/icons_cake.png","http://192.168.43.159/flutter_app1/Logo/icons_tar.png","http://192.168.43.159/flutter_app1/Logo/icons_khoshk.png","http://192.168.43.159/flutter_app1/Logo/icons_donat.png","http://192.168.43.159/flutter_app1/Logo/icons_finger.png","http://192.168.43.159/flutter_app1/Logo/icons_shokolat.png",] ));




    return Scaffold(

      body: SingleChildScrollView(

        child: Container(
          height: 850,
          child: StaggeredGridView.countBuilder(

                crossAxisCount: 6,
                itemBuilder: ShopList,
                itemCount: Shops.length,
                staggeredTileBuilder: (index) => StaggeredTile.count((index==0?6:3), (index==0?5:5))
          )
        )
      ),
    );
  }




  Widget HomeCategoryList(BuildContext context, int index) {
    return IndexHomeCategory(context,index, category_home);
  }

  Widget IndexHomeCategory(BuildContext context, int index , List<Category> list ){

    return Column(
      children: <Widget>[

        GestureDetector(
            child: Container(
              width: 100, height: 170, margin: EdgeInsets.only(left: 3, top: 20, bottom: 5,right: 13),
              decoration: BoxDecoration(border: Border.all(color: Color(0xffF1E6DD), width: 5), color: _selectedIndex != null && _selectedIndex == index ? Color(0xffF1E6DD): Colors.white24, borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(children: <Widget>[


                Container(margin:EdgeInsets.only(left: 3,right: 3),child: Image(image: NetworkImage(list[index].img), height: 100,)),

                Container(child: Center(child: Text(list[index].title,style: TextStyle(fontSize: 17,),)),alignment: Alignment(0.75, 0),),

              ],),
            ),
            onTap: () => _onSelected(index)),

        _selectedIndex != null && _selectedIndex == index ? Container(width:90,margin: EdgeInsets.only(right: 10),child: Center(child: Image(image: NetworkImage("http://192.168.43.159/flutter_app1/Logo/pointer.png"),),),) : Text(""),

      ],
    );
  }_onSelected(int index) {setState(() => _selectedIndex = index);}



  Widget ShopList(BuildContext context, int index) {
    if(index==0)return Category_Store_Widget();
    return indexProductView(context,index, Shops);
  }

  Widget indexProductView(context,int index, List<Shop> list) {

    return GestureDetector(child:Container(
      child: Stack(children: <Widget>[


        Container(width: 200, height: 300, margin: EdgeInsets.only(left : 5, right : 5,top: 72, bottom: 12),
          decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey[400], width: 0.3), color: Color(0xffDFEEFF), borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(children: <Widget>[

            Container(height: 60,),
            Container(child: Text(list[index].title,style: TextStyle(fontSize: 17,),),alignment: Alignment(0.75, 0),),
            Divider(endIndent: 10,indent: 10),

            Icons_List_Store(Shops[index].icons),

            Divider(endIndent: 10,indent: 10),
            Container(width: 120, child: Text("4.5", style: TextStyle(color: Colors.blueGrey , fontWeight: FontWeight.bold),),alignment: Alignment.bottomLeft,),

          ],
          ),
        ),
        Container(alignment : Alignment.topCenter,child: Image(image: NetworkImage(list[index].img_url), height: 120)),

      ],),
    )

      ,onTap: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> Shop_Solo_Screen(list[index].id)));});
  }

  Icons_List_Store(List<String> list){

    return Container(
      alignment: Alignment.topRight,
        height: 100,
        width: 100,
        child: StaggeredGridView.countBuilder(

            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            itemBuilder: IconList,
            itemCount: list.length,
            staggeredTileBuilder: (index) => StaggeredTile.count(1,1)
        )
    );
  }

  
  Widget IconList(BuildContext context, int index) {
    return IconView(context,index, Shops[index].icons);
  }


  Widget IconView(context , index , List<String> list){
    return Image(image: NetworkImage(list[index]));
  }



  Category_Store_Widget(){

    return Column(children: <Widget>[


    category_home.length > 0
    ? Container(
    child: ListView.builder(
    itemBuilder: HomeCategoryList,
    itemCount: category_home.length,
    scrollDirection: Axis.horizontal,
    ),height: 225,)

    : Container(child: Center(child: CircularProgressIndicator(),), height: 225,),


    _selectedIndex != null ?
    Container(
    color: Colors.yellow[100],
    height: 100,
    child: Column(
      children: <Widget>[
        Container(child: Text("  دستبندی :" + category_home[_selectedIndex].title , style: TextStyle(fontSize: 24)),margin: EdgeInsets.only(top: 7),alignment: Alignment.centerRight,),
        Container(child: Text("  تعداد فروشگاه‌های دارای" + category_home[_selectedIndex].title +" : 7 "  , style: TextStyle(fontSize: 17)),alignment: Alignment.centerRight),

      ],
    ),alignment: Alignment.centerRight)
        : Text("") ,
      ]);
  }





}

