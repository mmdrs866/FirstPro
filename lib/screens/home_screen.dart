import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:test_market/AppData.dart';
import 'package:test_market/Model/AppSlider.dart';
import 'package:test_market/Model/Boxes.dart';
import 'package:test_market/Model/Category.dart';
import 'package:test_market/Model/Product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:intl/intl.dart';
import 'package:test_market/SliderView.dart';
import 'package:test_market/screens/Cake_Screen.dart';
import 'package:test_market/screens/product_screen.dart';
import 'package:test_market/uitls/clippper.dart';
import 'Cart_Screen.dart';
import 'Shop_Screen.dart';

List<Product> new_product = [];
List<Product> order_product = [];
List<Category> category_home = [];
List<Category> category_shirini = [];
List<Category> category_coffee = [];
List<Boxes> box___________mustchange_futureee_______ = [];
BuildContext context;

int _selectedIndex = 0;

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}


class _homePageState extends State<homePage> {
  int tab_index = 0;
  void getProductList(String action, List<Product> list) {
    if (new_product.length == 0) {
      var url = "http://192.168.43.159/flutter_app1/?action=" + action;

      http.get(url).then((response) {
        print(response.statusCode);

        if (response.statusCode == 200) {
          List jsonResponse = convert.jsonDecode(response.body);

          for (int i = 0; i < jsonResponse.length; i++) {
            if (action == "new_product") {
              setState(() {
                new_product.add(new Product(
                    title: jsonResponse[i]['title'],
                    img: AppData.server_url+jsonResponse[i]['img_url'],
                    price: int.parse(jsonResponse[i]['price']),
                    id: int.parse(jsonResponse[i]['id'])));
              });
            } else if (action == "order_product") {
              setState(() {
                order_product.add(new Product(
                    title: jsonResponse[i]['title'],
                    img: AppData.server_url+jsonResponse[i]['img_url'],
                    price: int.parse(jsonResponse[i]['price'],),
                    id: int.parse(jsonResponse[i]['id'])));
              });
            }
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {


//    sliders.add(Center(
//      child: Text("slider 1"),
//    ));
//    sliders.add(Center(
//      child: Text("slider 2"),
//    ));
//    sliders.add(Center(
//      child: Text("slider 3"),
//    ));

//   category_home.add({"title":" قایق بادی","img":"images/boat.jpg","price"});
//   category_home.add({"title":"توپ بسکتبال","img":"images/ball.jpg","price"});
//   category_home.add({"title":"جاروبرقی","img":"images/barghi.jpg"});

    getProductList("new_product", new_product);
    getProductList("order_product", order_product);


    if(category_home.length==0)
{  category_home.add(new Category(title:" شیرینی‌ تر ",img:"http://192.168.43.159/flutter_app1/Category/tar.png",cattype: 0));
  category_home.add(new Category(title:" شیرینی‌ خشک ",img:"http://192.168.43.159/flutter_app1/Category/khoshk.png",cattype: 0));
  category_home.add(new Category(title:" دونات ",img:"http://192.168.43.159/flutter_app1/Category/donat.png",cattype: 0));
  category_home.add(new Category(title:" کیک روز ",img:"http://192.168.43.159/flutter_app1/Category/cake.png",cattype: 0));
  category_home.add(new Category(title:" فینگر فود ",img:"http://192.168.43.159/flutter_app1/Category/fingerfood.png",cattype: 0));
  category_home.add(new Category(title:" آجیل ",img:"http://192.168.43.159/flutter_app1/Category/ajil.png",cattype: 0));
  category_home.add(new Category(title:" شکلات ",img:"http://192.168.43.159/flutter_app1/Category/shokolat.png",cattype: 0));
  category_home.add(new Category(title:" یکبار مصرف ",img:"http://192.168.43.159/flutter_app1/Category/yebarmasraf.png",cattype: 0));
  category_home.add(new Category(title:" نوشیدنی گرم ",img:"http://192.168.43.159/flutter_app1/Category/ghahve.png",cattype: 1));
  category_home.add(new Category(title:" نوشیدنی سرد ",img:"http://192.168.43.159/flutter_app1/Category/ghahve.png",cattype: 1));}


    if(category_shirini.length==0)
{  category_shirini.add(new Category(title:" شیرینی‌ تر ",img:"http://192.168.43.159/flutter_app1/Category/tar.png",cattype: 0));
  category_shirini.add(new Category(title:" شیرینی‌ خشک ",img:"http://192.168.43.159/flutter_app1/Category/khoshk.png",cattype: 0));
  category_shirini.add(new Category(title:" دونات ",img:"http://192.168.43.159/flutter_app1/Category/donat.png",cattype: 0));
  category_shirini.add(new Category(title:" کیک روز ",img:"http://192.168.43.159/flutter_app1/Category/cake.png",cattype: 0));
  category_shirini.add(new Category(title:" فینگر فود ",img:"http://192.168.43.159/flutter_app1/Category/fingerfood.png",cattype: 0));
  category_shirini.add(new Category(title:" آجیل ",img:"http://192.168.43.159/flutter_app1/Category/ajil.png",cattype: 0));
  category_shirini.add(new Category(title:" شکلات ",img:"http://192.168.43.159/flutter_app1/Category/shokolat.png",cattype: 0));
  category_shirini.add(new Category(title:" یکبار مصرف ",img:"http://192.168.43.159/flutter_app1/Category/yebarmasraf.png",cattype: 0));}
  if(category_coffee.length==0)
{  category_coffee.add(new Category(title:" نوشیدنی گرم ",img:"http://192.168.43.159/flutter_app1/Category/ghahve.png",cattype: 1));
  category_coffee.add(new Category(title:" نوشیدنی سرد ",img:"http://192.168.43.159/flutter_app1/Category/ghahve.png",cattype: 1));}

//    Color(0xffFBC420)
//    Color(0xff003333)


    return Scaffold(
        extendBody: false,
        extendBodyBehindAppBar: true,

            backgroundColor: Colors.white,

            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    onDetailsPressed: () {},
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.black54,
//                  Colors.black45,
                      Colors.orange.shade300,
                    ])),
                    accountName: Text(
                      "اسم شما",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    accountEmail: Text("09198668660",
                        style: TextStyle(fontSize: 16, color: Colors.black45)),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(
                        "G",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text("پروفایل"),
                    leading: Icon(Icons.person),
                  ),
                  ListTile(
                    title: Text("گروه ها"),
                    leading: Icon(Icons.group),
                  ),
                  ListTile(
                    title: Text("تماس"),
                    leading: Icon(Icons.call),
                  ),
                  ListTile(
                    title: Text("کانتکت ها"),
                    leading: Icon(Icons.contacts),
                  ),
                  ListTile(
                    title: Text("تنظیمات"),
                    leading: Icon(Icons.settings),
                  ),
                  ListTile(
                    title: Text("خروج"),
                    leading: Icon(Icons.exit_to_app),
                  ),
                ],
              ),
            ),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(90),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                flexibleSpace: ClipPath(
                  clipper: CustomClipperForAppBar(),
                  child: Container(decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [

                      Color(0xff003333),
                      Color(0xff003333),

//                      Colors.blueGrey[800],

                    ])
                    
                  ),),
                ),
                title: Center(child: Container(margin : EdgeInsets.only(top: 7),height: 50,
                  child: Image(image: NetworkImage("http://192.168.43.159/flutter_app1/Logo/logo_persian.png"),),
                ),),
                actions: <Widget>[
////                IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){
////                  AppData.GoNewScreen(context, Cart_Screen(), -4, -2);
////                }),
                  IconButton(icon: Icon(Icons.search), onPressed: (){})

                ],
              ),
            ),
            body:

            _children(tab_index)

        ,
        bottomNavigationBar: Theme(
         data: Theme.of(context).copyWith(

          canvasColor: Color(0xff003333),
          primaryColor: Colors.red,
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(caption: new TextStyle(color: Colors.yellow))), // sets the inactive color of the `BottomNavigationBar`
            child: BottomNavigationBar(fixedColor: Color(0xffFBC420),unselectedItemColor: Colors.white,
              backgroundColor: Color(0xff003333),selectedIconTheme: IconThemeData(size: 35,),
              items: [

                BottomNavigationBarItem(
                  icon: Icon(Icons.cake), title: Text("خانه"),),
                BottomNavigationBarItem(
                    icon: Icon(Icons.store), title: Text("قنادی")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), title: Text("سبد خرید")),

        ],
        onTap: (index) {
          setState(() {
            tab_index = index;
          });
        },
        currentIndex: tab_index,
      ),
    )
    );

  }
  Widget _children(index) {
    List<Widget> page_screen = [];

    page_screen.add(_home_page_screen());
    page_screen.add(Shop_Screen());
    page_screen.add(Cart_Screen());

    return page_screen[index];
  }

Widget _home_page_screen(){


  return SingleChildScrollView(
      child: Column(children: <Widget>[



        Container(height: 100,),

        HomeSlider(),

      category_home.length > 0
          ? Container(
        child: ListView.builder(
          itemBuilder: HomeCategoryList,
          itemCount: category_home.length,
          scrollDirection: Axis.horizontal,

        ),height: 225,)
          : Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
        height: 225,
      ),
        
        _selectedIndex != null ?
        Container(child: Text("دستبندی :" + category_home[_selectedIndex].title ,
          style: TextStyle(fontSize: 20),),alignment: Alignment.centerRight,margin: EdgeInsets.only(right: 10),height: 30,)
            : Text("") ,
        





        Container(color: Colors.white,
          child:
        Stack(children: <Widget>[

          Container(
            child:
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "  قنادی نیشکر",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black.withAlpha(400),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(""),
                ),
              ],
            ),
            margin: EdgeInsets.only(top: 70),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.grey[600],
                  Colors.grey[400],
                  Colors.grey[200],
                  Color(0xffF1E6DD),
                  Colors.white,
                  Color(0xffF1E6DD),

                ])
            ),
          ),
          Container(margin: EdgeInsets.only(left: 20,top: 0),alignment: Alignment.centerLeft,child: Image(height: 120,image: NetworkImage("http://192.168.43.159/flutter_app1/Shops/neyshekar.png"),),)
        ]),),
        new_product.length > 0
            ? Container(
          child: ListView.builder(
            itemBuilder: NewProductList,
            itemCount: new_product.length,
            scrollDirection: Axis.horizontal,

          ),
          height: 250,
          decoration: BoxDecoration(color: Colors.white),
        )
            : Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
          height: 250,
        ),
        Container(color: Colors.white,
          child:
          Stack(children: <Widget>[

            Container(
              child:
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "  قنادی نیشکر",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black.withAlpha(400),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(""),
                  ),
                ],
              ),
              margin: EdgeInsets.only(top: 70),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.grey[600],
                    Colors.grey[400],
                    Colors.grey[200],
                    Color(0xffF1E6DD),
                    Colors.white,
                    Color(0xffF1E6DD),

                  ])
              ),
            ),
            Container(margin: EdgeInsets.only(left: 20,top: 0),alignment: Alignment.centerLeft,child: Image(height: 120,image: NetworkImage("http://192.168.43.159/flutter_app1/Shops/sali.png"),),)
          ]),),
        order_product.length > 0
            ? Container(
          child: ListView.builder(
            itemBuilder: OrderProductList,
            itemCount: order_product.length,
            scrollDirection: Axis.horizontal,
          ),
          height: 250,
          decoration: BoxDecoration(color: Colors.white),
        )
            : Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
          height: 250,
        ),
        

      ]));


}


Widget NewProductList(BuildContext context, int index) {
  return indexProductView(context,index, new_product);
}

Widget OrderProductList(BuildContext context, int index) {
  return indexProductView(context,index, order_product);
}

Widget indexProductView(context,int index, List<Product> list) {


  String pricee = "";
  String toman = " تومان ";
  var formatter = new NumberFormat("###,###");
  pricee = formatter.format(new_product[index].price) + toman;
  String title = list[index].title.length>25 ? list[index].title.substring(0,15)+"..." : list[index].title ;

  return GestureDetector(child:Stack(children: <Widget>[


    Container(width: 140, height: 200, margin: EdgeInsets.only(left: 20, top: 55, bottom: 12),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey[200], width: 1), color: Color(0xffF1E6DD), borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(children: <Widget>[

          Container(height: 100),
          Container(child: Text(title,style: TextStyle(fontSize: 17,),),alignment: Alignment(0.75, 0),),
          Container(width: 120, child: Text(pricee, textAlign: TextAlign.left, style: TextStyle(color: Colors.black54),)),
          Container(width: 120, child: Text("4.5", textAlign: TextAlign.left, style: TextStyle(color: Colors.blueGrey , fontWeight: FontWeight.bold),), margin: EdgeInsets.only(top: 5),),

        ],
      ),
    ),
  Image(image: NetworkImage(list[index].img), height: 150, fit: BoxFit.fill,),

  ],)

    ,onTap: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> ProductPage(list[index].id,box___________mustchange_futureee_______)));},);
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

        _selectedIndex != null && _selectedIndex == index ? Container(width:90,margin: EdgeInsets.only(right: 10),child: Center(child: Image(image: NetworkImage("http://192.168.43.159/flutter_app1/Logo/pointer.png"),),),) : Text("")



      ],
    );

}

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

}



//Widget Shops_show(){
//
//  return Row(children: <Widget>[
//    Container(child: Column(children: <Widget>[
//
//      Container(child: Image(image: NetworkImage(AppData.server_url+List[index]),fit: BoxFit.fill,),)
//
//    ],),)
//  ],);
//}

//Widget Shops_show1(){
//
//  return GestureDetector(child:Stack(children: <Widget>[
//
//
//    Container(width: 140, height: 180, margin: EdgeInsets.only(left: 20, top: 55, bottom: 12),
//      decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 1), color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
//      child: Column(children: <Widget>[
//
//        Container(height: 100),
//        Container(child: Text(title,style: TextStyle(fontSize: 17,),),alignment: Alignment(0.75, 0),),
//        Container(width: 120, child: Text(pricee, textAlign: TextAlign.left, style: TextStyle(color: Colors.black54),)),
//
//      ],
//      ),
//    ),
//    Image(image: NetworkImage(list[index].img), height: 150, fit: BoxFit.fill,)
//  ],)
//
//    ,onTap: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> ProductPage(list[index].id,list[index].title,'product')));},);
//}