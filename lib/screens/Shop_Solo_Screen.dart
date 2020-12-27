import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:test_market/Model/Boxes.dart';
import 'package:test_market/Model/Category.dart';
import 'package:test_market/Model/CategoryProduct.dart';
import 'package:test_market/Model/Product.dart';
import 'package:test_market/Model/Shop.dart';
import 'package:test_market/screens/home_screen.dart';
import 'package:test_market/screens/product_screen.dart';
import 'package:test_market/uitls/StoreCategoryClipper.dart';
import 'package:http/http.dart' as http;
import 'package:visibility_detector/visibility_detector.dart';
import 'dart:convert' as convert;
import '../AppData.dart';





class Shop_Solo_Screen extends StatefulWidget {
  @override

  int store_id;


  Shop_Solo_Screen(int id){store_id=id;}

  _Shop_Solo_ScreenState createState() => _Shop_Solo_ScreenState(store_id);
}

class _Shop_Solo_ScreenState extends State<Shop_Solo_Screen> {
  @override

  List<Shop> shop_details =[];
  List<CategoryProduct> cat_pro_list =[];
  int _currentItem = 0;
  int Category_index =0;

  ItemScrollController _scrollController = ItemScrollController();
  int _selectedIndex = 0;
  _onSelected(int index) {setState(() => _selectedIndex = index);}

  Shop thisshop = new Shop();

  get_StoreDetail(int store_id){

    if (cat_pro_list.length == 0) {
      var url = "http://192.168.43.159/flutter_app1/?action=" + store_id.toString();

      http.get(url).then((response) {
        print(response.statusCode);
        print(url);

        if (response.statusCode == 200) {
          List jsonResponse = convert.jsonDecode(response.body);

          for (int i = 0; i < jsonResponse.length; i++) {
            setState(() {
              shop_details.add(new Shop(
                title: jsonResponse[i]['ShopName'],
                img_url: jsonResponse[i]['ShopImage'],
                comments: jsonResponse[i]['Comments'],
                rate: jsonResponse[i]['Rate'],
                active_status: jsonResponse[i]['ActiveStatus'],
                active_time: jsonResponse[i]['ActiveTime'],
                delivery_price: jsonResponse[i]['DeliveryPrice'],
                box: jsonResponse[i]['box'],
              ));});
          }
        }
      });
    }


  }

  get_CategoryProducts(int store_id) {
    if (cat_pro_list.length == 0) {
      var url = "http://192.168.43.159/flutter_app1/?action=" + store_id.toString();

      http.get(url).then((response) {
        print(response.statusCode);
        print(url);

        if (response.statusCode == 200) {
          List jsonResponse = convert.jsonDecode(response.body);

          for (int i = 0; i < jsonResponse.length; i++) {
            setState(() {
              cat_pro_list.add(new CategoryProduct(
                category_name: jsonResponse[i]['CategoryName'],
                category_products: jsonResponse[i]['CategoryProduct'],
              ));});
          }
        }
      });
    }
  }




  String title = "";
  String img_url = "";
  List<Category> category = [];

  _Shop_Solo_ScreenState(int id){




//    add shodan api ba id e store



  shop_details.add(new Shop(title:" نیشکر",img_url:"http://192.168.43.159/flutter_app1/Shops/neyshekar.png",active_status: true,active_time: [],rate: 4.5,delivery_price: 5000));
  shop_details[0].active_time.add("شنبه - دو شنبه ۹-۲۲");
  shop_details[0].active_time.add("شنبه - چهار شنبه ۸-۲۳");
  shop_details[0].active_time.add("پنجشنبه -جمع ۸-۲۴");

  if(category.length==0)
{  category.add(new Category(title:" شیرینی‌ تر ",img:"http://192.168.43.159/flutter_app1/Category/tar.png"));
  category.add(new Category(title:" شیرینی‌ خشک ",img:"http://192.168.43.159/flutter_app1/Category/khoshk.png"));
  category.add(new Category(title:" قهوه ",img:"http://192.168.43.159/flutter_app1/Category/ghahve.png"));
  category.add(new Category(title:" دونات ",img:"http://192.168.43.159/flutter_app1/Category/donat.png"));
  category.add(new Category(title:" کیک روز ",img:"http://192.168.43.159/flutter_app1/Category/cake.png"));
  category.add(new Category(title:" فینگر فود ",img:"http://192.168.43.159/flutter_app1/Category/fingerfood.png"));
  category.add(new Category(title:" آجیل ",img:"http://192.168.43.159/flutter_app1/Category/ajil.png"));
  category.add(new Category(title:" شکلات ",img:"http://192.168.43.159/flutter_app1/Category/shokolat.png"));
  category.add(new Category(title:" یکبار مصرف ",img:"http://192.168.43.159/flutter_app1/Category/yebarmasraf.png"));}

  List<Product> localProducts = [];
  List<Product> localProducts2 = [];

  shop_details[0].box = [];
  shop_details[0].box.add(new Boxes(tedade_radif_jabe: 3,vazn_jabe: 0.5 ));
  shop_details[0].box.add(new Boxes(tedade_radif_jabe: 4,vazn_jabe: 1 ));
  shop_details[0].box.add(new Boxes(tedade_radif_jabe: 6,vazn_jabe: 2 ));

if(localProducts.length==0)
{  localProducts.add(new Product(id:1 ,title: " آجیل ", price: 200 , img:"http://192.168.43.159/flutter_app1/Shirini_Khoshk/1.png"));
  localProducts.add(new Product(id:2 ,title: " شکلات ", price: 300 , img:"http://192.168.43.159/flutter_app1/Shirini_Khoshk/2.png"));
  localProducts.add(new Product(id:3 ,title: " کیک روز ", price: 300 , img:"http://192.168.43.159/flutter_app1/Shirini_Khoshk/3.png"));
  localProducts.add(new Product(id:4 ,title: " شیرینی‌ خشک ", price: 300 , img:"http://192.168.43.159/flutter_app1/Shirini_Khoshk/4.png"));
  localProducts.add(new Product(id:5 ,title: " دونات ", price: 300 , img:"http://192.168.43.159/flutter_app1/Shirini_Khoshk/5.png"));
  localProducts.add(new Product(id:6 ,title: "  شیرینی‌ تر ", price: 300 , img:"http://192.168.43.159/flutter_app1/Shirini_Khoshk/6.png"));
  localProducts.add(new Product(id:7 ,title: " آجیل ", price: 200 , img:"http://192.168.43.159/flutter_app1/Shirini_Khoshk/7.png"));
  localProducts.add(new Product(id:1 ,title: " آجیل ", price: 200 , img:"http://192.168.43.159/flutter_app1/Shirini_Khoshk/8.png"));
  localProducts.add(new Product(id:2 ,title: " شکلات ", price: 300 , img:"http://192.168.43.159/flutter_app1/Shirini_Khoshk/9.png"));
  localProducts.add(new Product(id:3 ,title: " کیک روز ", price: 300 , img:"http://192.168.43.159/flutter_app1/Shirini_Khoshk/10.png"));
  localProducts.add(new Product(id:4 ,title: " شیرینی‌ خشک ", price: 300 , img:"http://192.168.43.159/flutter_app1/Shirini_Khoshk/11.png"));
  localProducts.add(new Product(id:5 ,title: " دونات ", price: 300 , img:"http://192.168.43.159/flutter_app1/Shirini_Khoshk/12.png"));
  localProducts.add(new Product(id:6 ,title: "  شیرینی‌ تر ", price: 300 , img:"http://192.168.43.159/flutter_app1/Shirini_Khoshk/1.png"));
  localProducts.add(new Product(id:7 ,title: " آجیل ", price: 200 , img:"http://192.168.43.159/flutter_app1/Shirini_Khoshk/2.png"));
  localProducts.add(new Product(id:3 ,title: " کیک روز ", price: 300 , img:"http://192.168.43.159/flutter_app1/Category/cake.png"));
  localProducts.add(new Product(id:4 ,title: " شیرینی‌ خشک ", price: 300 , img:"http://192.168.43.159/flutter_app1/Category/khoshk.png"));
  localProducts.add(new Product(id:5 ,title: " دونات ", price: 300 , img:"http://192.168.43.159/flutter_app1/Category/donat.png"));
  localProducts.add(new Product(id:6 ,title: "  شیرینی‌ تر ", price: 300 , img:"http://192.168.43.159/flutter_app1/Category/tar.png"));
  localProducts.add(new Product(id:7 ,title: " آجیل ", price: 200 , img:"http://192.168.43.159/flutter_app1/Category/ajil.png"));
  localProducts.add(new Product(id:1 ,title: " آجیل ", price: 200 , img:"http://192.168.43.159/flutter_app1/Category/ajil.png"));
  localProducts.add(new Product(id:2 ,title: " شکلات ", price: 300 , img:"http://192.168.43.159/flutter_app1/Category/shokolat.png"));
  localProducts.add(new Product(id:3 ,title: " کیک روز ", price: 300 , img:"http://192.168.43.159/flutter_app1/Category/cake.png"));
  localProducts.add(new Product(id:4 ,title: " شیرینی‌ خشک ", price: 300 , img:"http://192.168.43.159/flutter_app1/Category/khoshk.png"));
  localProducts.add(new Product(id:5 ,title: " دونات ", price: 300 , img:"http://192.168.43.159/flutter_app1/Category/donat.png"));
  localProducts.add(new Product(id:6 ,title: "  شیرینی‌ تر ", price: 300 , img:"http://192.168.43.159/flutter_app1/Category/tar.png"));
  localProducts.add(new Product(id:7 ,title: " آجیل ", price: 200 , img:"http://192.168.43.159/flutter_app1/Category/ajil.png"));}
  if(localProducts2.length==0)
{  localProducts2.add(new Product(id:1 ,title: " شکلات ", price: 300 , img:"http://192.168.43.159/flutter_app1/Category/shokolat.png"));
  localProducts2.add(new Product(id:2 ,title: " کیک روز ", price: 300 , img:"http://192.168.43.159/flutter_app1/Category/cake.png"));
  localProducts2.add(new Product(id:3 ,title: " شیرینی‌ خشک ", price: 300 , img:"http://192.168.43.159/flutter_app1/Category/khoshk.png"));
  localProducts2.add(new Product(id:4 ,title: " دونات ", price: 300 , img:"http://192.168.43.159/flutter_app1/Category/donat.png"));
  localProducts2.add(new Product(id:5 ,title: "  شیرینی‌ تر ", price: 300 , img:"http://192.168.43.159/flutter_app1/Category/tar.png"));}

  if(cat_pro_list.length==0)
{  cat_pro_list.add(new CategoryProduct(category_name: " معرفی‌ فروشگاه " ,category_products: localProducts ));
  cat_pro_list.add(new CategoryProduct(category_name: " شیرینی‌ خشک " ,category_products: localProducts ));
  cat_pro_list.add(new CategoryProduct(category_name: " شیرینی‌ تر " ,category_products: localProducts ));
  cat_pro_list.add(new CategoryProduct(category_name: " دونات " ,category_products: localProducts ));
  cat_pro_list.add(new CategoryProduct(category_name: " کیک روز " ,category_products: localProducts ));
  cat_pro_list.add(new CategoryProduct(category_name: " شکلات " ,category_products: localProducts ));
  cat_pro_list.add(new CategoryProduct(category_name: " شیرینی‌ تر " ,category_products: localProducts ));
  cat_pro_list.add(new CategoryProduct(category_name: " آجیل " ,category_products: localProducts ));
  cat_pro_list.add(new CategoryProduct(category_name: " کیک روز " ,category_products: localProducts ));
  cat_pro_list.add(new CategoryProduct(category_name: " شکلات " ,category_products: localProducts ));
  cat_pro_list.add(new CategoryProduct(category_name: " شیرینی‌ تر " ,category_products: localProducts ));
  cat_pro_list.add(new CategoryProduct(category_name: " آجیل " ,category_products: localProducts ));}



  }




  Widget build(BuildContext context) {
    int id = widget.store_id;
    double w=MediaQuery.of(context).size.width;

    return Scaffold(


      body: Row(children: <Widget>[

         Container(
           width : w/6*5 ,
           color: Colors.white12,
           child:ScrollablePositionedList.builder(
             itemScrollController: _scrollController,
             itemCount: cat_pro_list.length,
             itemBuilder: (context, index) {
               return VisibilityDetector(
                   key: Key(index.toString()),
                   onVisibilityChanged: (VisibilityInfo info) {
                       setState(() {
                         _currentItem = index;
                         _selectedIndex = _currentItem;
                       });
                   },
                   child: Product_view1(context, index)
               );
             },
           )
         ),


         ClipPath(
           clipper: StoreCategoryClipper(),
           child: Container(
             width : w/6   ,
             color: Color(0xff003333),
             child:Column(children: <Widget>[

               Container(margin: EdgeInsets.only(top: 50,left: 12,right: 12),
                   child: Image(image: NetworkImage("http://192.168.43.159/flutter_app1/logo/logo_icon.png"))),

               RotatedBox(
                 quarterTurns: 3,
                 child: Container(
                   margin: EdgeInsets.only(right: 30),
                   height: MediaQuery.of(context).size.width,
                   width: MediaQuery.of(context).size.height-130,
                   child: ListView.builder(
                     itemBuilder: SideCategoryList,
                     itemCount: cat_pro_list.length,
                     scrollDirection: Axis.horizontal,),
                 ),
               )


             ],),))

      ],),


    );
  }

  Widget SideCategoryList(BuildContext context,int index){
    return GestureDetector(
      child: Container(
        color: _selectedIndex != null && _selectedIndex == index ? Colors.white12: Colors.transparent,
        child: Center(
            child: Text("  "+cat_pro_list[index].category_name+"  ",
              style: TextStyle(
                  fontSize:20,
                  color: _selectedIndex != null && _selectedIndex == index ? Color(0xffFBC420): Colors.white30,
                  fontWeight: FontWeight.bold
              ),)),
      ),onTap: (){_onSelected(index);_scrollController.scrollTo(index: index, duration: Duration(milliseconds: 1500,));},
    );
  }



  Widget Product_view1(BuildContext context,int index){

    Category_index = index;

    if(index==0)
      {
        return SizedBox(
            child:Container(color: Colors.blueGrey[100],
              child: Stack(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 160),
                    child: Divider(thickness: 3,)),
                Container(
                  margin: EdgeInsets.only(top: 125,right: 12),
                  child: Column(children: <Widget>[
                  Container(
                      alignment: Alignment.centerRight,
                      child: Text(shop_details[0].title,
                        style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                  Container(
                      child: Row(children: <Widget>[
                        Text("امتیاز "),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Color(0xff003333),
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Center(
                              child: Text(shop_details[0].rate.toString(),style: TextStyle(color: Colors.white),)),),],)),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: <Widget>[
                        Text("هزینه ارسال سفارش : " ),
                        shop_details[0].delivery_price == 0
                            ? Text("رایگان" )
                            : Text(shop_details[0].delivery_price.toString()),
                      ],
                    ),),
                  Container(
                      alignment: Alignment.centerRight,
                      child: shop_details[0].active_status==true
                          ? Text("آماده ارسال محصولات",style: TextStyle(color: Colors.green[600]),)
                          : Text("در حال حاضر فروشگاه قادر به سرویس دهی‌ نمیباشد",style: TextStyle(color: Colors.red),),),

                  Container(
                      height: (shop_details[0].active_time.length*35).roundToDouble(),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: shop_details[0].active_time.length,
                        itemBuilder: (BuildContext,index) {return Text(shop_details[0].active_time[index]);},),
                    ),

                  RaisedButton(
                      child: Container(
                          width: 170,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[Text(" کیک سفارشی برای شما "),Container(child: Icon(Icons.cake)),], )), onPressed: (){index=0;}),
                  RaisedButton(
                      child: Container(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[Text(" نظرات "),Container(child: Text(shop_details[0].comments==[]?shop_details[0].comments.length.toString():0.toString())),], )), onPressed: (){index=0;}),


                ],),),
                Container(
                  margin: EdgeInsets.only(top: 70,left: 15),
                  height: 135,
                  child: Image(image: NetworkImage(shop_details[0].img_url),),alignment: Alignment.topLeft,)
              ],),
            ));
      };

    return SizedBox(
      child: Column(
        children: <Widget>[

          FractionallySizedBox(
            widthFactor: 1,
            child: Container(
              margin: EdgeInsets.only(top: 90),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [

                    Color(0xffF1E6DD),
                    Colors.white,
                    Color(0xffF1E6DD),
                    Colors.grey[200],
                    Colors.grey[400],
                    Colors.grey[500],

                  ])
              ),
              height: 50,
              child: Text(cat_pro_list[index].category_name,style: TextStyle(fontSize: 22,color: Colors.blueGrey[800],fontWeight: FontWeight.bold),),),
          ),

          SizedBox(
            child: ListView.builder(
              shrinkWrap: true, physics: NeverScrollableScrollPhysics(),
                itemBuilder: Product_view2,
                itemCount: ((cat_pro_list[index].category_products.length/18).round())+1,
            ),
          ),

        ],
      ),
    );
  }


  Widget Product_view2(BuildContext context ,int index){

    return Container(
        child: Product_view3(context,index,cat_pro_list[index].category_products));
  }

  Widget Product_view3(BuildContext context ,int index,List<Product> products){

    int i = index;
    double hightbox = 180;
    double hightbox2 = hightbox * 2;
    int max = products.length;

    return Column(children: <Widget>[

      Row(children: <Widget>[
        i < max ? Expanded(
          child: Container(height: hightbox2, child: ExplorBox(context, i)),
          flex: 2,) : Expanded(child: Container()),
        Expanded(child:
        Column(children: <Widget>[
          i + 1 < max
              ? Container(height: hightbox, child: ExplorBox(context, i + 1))
              : Container(),
          i + 2 < max
              ? Container(height: hightbox, child: ExplorBox(context, i + 2))
              : Container()
        ],))
      ],)

      , Row(children: <Widget>[
        i + 3 < max ? Expanded(child: Container(
            height: hightbox, child: ExplorBox(context, i + 3))) : Expanded(
            child: Container()),
        i + 4 < max ? Expanded(child: Container(
            height: hightbox, child: ExplorBox(context, i + 4))) : Expanded(
            child: Container()),
        i + 5 < max ? Expanded(child: Container(
            height: hightbox, child: ExplorBox(context, i + 5))) : Expanded(
            child: Container())
      ],)


      , Row(children: <Widget>[
        i + 6 < max ? Expanded(child: Container(
            height: hightbox, child: ExplorBox(context, i + 6))) : Expanded(
            child: Container()),
        i + 7 < max ? Expanded(child: Container(
            height: hightbox, child: ExplorBox(context, i + 7))) : Expanded(
            child: Container()),
        i + 8 < max ? Expanded(child: Container(
            height: hightbox, child: ExplorBox(context, i + 8))) : Expanded(
            child: Container())
      ],)

      , Row(children: <Widget>[
        Expanded(child:
        Column(children: <Widget>[
          i + 9 < max
              ? Container(height: hightbox, child: ExplorBox(context, i + 9))
              : Container(),
          i + 10 < max
              ? Container(height: hightbox, child: ExplorBox(context, i + 10))
              : Container()
        ],))

        ,
        i + 11 < max
            ? Expanded(child: Container(
            height: hightbox2, child: ExplorBox(context, i + 11)), flex: 2,)
            : Expanded(child: Container())
      ],)

      , Row(children: <Widget>[
        i + 12 < max ? Expanded(child: Container(
            height: hightbox, child: ExplorBox(context, i + 12))) : Expanded(
            child: Container()),
        i + 13 < max ? Expanded(child: Container(
            height: hightbox, child: ExplorBox(context, i + 13))) : Expanded(
            child: Container()),
        i + 14 < max ? Expanded(child: Container(
            height: hightbox, child: ExplorBox(context, i + 14))) : Expanded(
            child: Container())
      ],)


      , Row(children: <Widget>[
        i + 15 < max ? Expanded(child: Container(
            height: hightbox, child: ExplorBox(context, i + 15))) : Expanded(
            child: Container()),
        i + 16 < max ? Expanded(child: Container(
            height: hightbox, child: ExplorBox(context, i + 16))) : Expanded(
            child: Container()),
        i + 17 < max ? Expanded(child: Container(
            height: hightbox, child: ExplorBox(context, i + 17))) : Expanded(
            child: Container())
      ],)


    ],);

  }



  Widget ExplorBox (context,int i){


    return GestureDetector(onTap : (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> ProductPage(cat_pro_list[Category_index].category_products[i].id,shop_details[0].box)));},
      child:Container( margin : EdgeInsets.all(3),decoration: BoxDecoration(color: Color(0xffF1E6DD),border: Border.all(width: 0.1 , color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(children: <Widget>[
            Image(image: NetworkImage(cat_pro_list[Category_index].category_products[i].img)),
            Column(children: <Widget>[
              Text(cat_pro_list[Category_index].category_products[i].title),
              Text(cat_pro_list[Category_index].category_products[i].price.toString()),
              Container(width: 120, child: Text("4.5",textAlign: TextAlign.left, style: TextStyle(color: Colors.blueGrey , fontWeight: FontWeight.bold),), margin: EdgeInsets.only(top: 5),),

            ],)
          ],)),);
  }




}
