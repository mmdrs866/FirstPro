import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:test_market/Model/Product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:test_market/AppData.dart';
import 'product_screen.dart';


List<Product> cake_product = [];

class Cake_Screen extends StatefulWidget {
  @override
  _Cake_ScreenState createState() => _Cake_ScreenState();
}

class _Cake_ScreenState extends State<Cake_Screen> {
  @override
  Widget build(BuildContext context) {
    void getCakeList(String action, List<Product> list) {
      if (cake_product.length == 0) {
        var url = "http://192.168.43.159/flutter_app1/?action=" + action;

        http.get(url).then((response) {
          print(response.statusCode);
          print(url);

          if (response.statusCode == 200) {
            List jsonResponse = convert.jsonDecode(response.body);

            for (int i = 0; i < jsonResponse.length; i++) {
              setState(() {
                cake_product.add(new Product(
                    title: jsonResponse[i]['title'],
                    img: AppData.server_url + jsonResponse[i]['img_url'],
                    price: int.parse(jsonResponse[i]['price']),
                    id: int.parse(jsonResponse[i]['id'])));
              });
            }
          }
        });
      }
    }


    getCakeList('cake_product', cake_product);


    int i = (cake_product.length / 18).round();

    double m = MediaQuery
        .of(context)
        .size
        .width;
    double hightbox = 180;
    double hightbox2 = hightbox * 2;
    int max = cake_product.length;
//    for(i=0;i<(cake_product.length/18).round();i++)
    return Scaffold(

      extendBody: false,
      extendBodyBehindAppBar: false,

      body: SingleChildScrollView(

      child:
      Column(children: <Widget>[

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



      ],)
        ,),);

    for (i = 0; i < (cake_product.length / 18).round(); i++) {}
  }


  Widget ExplorBox (context,int i){


    return GestureDetector(onTap : (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> ProductPage(cake_product[i].id,cake_product[i].title,'cake_product')));},
      child:Container( decoration: BoxDecoration(border: Border.all(width: 0.1 , color: Colors.grey),),
          child: Column(children: <Widget>[
        Image(image: NetworkImage(cake_product[i].img)),
        Column(children: <Widget>[
          Text(cake_product[i].title),
          Text(cake_product[i].price.toString()),
        ],)
      ],)),);
  }



}

