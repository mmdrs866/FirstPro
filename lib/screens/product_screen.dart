 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
 import 'package:http/http.dart' as http;
 import 'dart:convert' as convert;
 import 'CommentForm.dart';
 import 'Comments.dart';
import '../AppData.dart';
import 'Cart_Screen.dart';
import 'Cart.dart';



class ProductPage extends StatefulWidget {



  int product_id;
  String title;
  String type;
  ProductPage(int id,String title,String type){

    this.title = title.length>25 ? title.substring(0,30)+"..." : title ;


    product_id=id;
    this.title=title;
    this.type=type;
    print("alaivee");


  }

  @override
  _ProductPageState createState() => _ProductPageState(product_id,type);
}

class _ProductPageState extends State<ProductPage> {


  List <dynamic> comment_list=[];



  String title = "";
  String img_url = "";
  String content = "";
  String price = "";
  String product_price = "";
  int tab_index = 0;

  var _checkBeforGerdoo=false;
  var _checkBeforMoz=false;
  var _checkBeforEspanjnescafe=false;
  var _checkBeforEspanjsade=false;





  _ProductPageState(product_id,type) {
    print("alaivee");


    if (type=='cake_product'){String url = AppData.server_url + "?action=getCake_ProductData&id=" + product_id.toString();_getProduct(product_id,url);}
    if (type=="product"){String url = AppData.server_url + "?action=getProductData&id=" + product_id.toString();_getProduct(product_id,url);}





  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(


        body:
        (

//            _children(tab_index)
        _tozihat_screen()

        ),


//        bottomNavigationBar: BottomNavigationBar(fixedColor: Colors.black12,
//          backgroundColor: Colors.orange.shade400,
//          items: [
//
//            BottomNavigationBarItem(
//              icon: Icon(Icons.title), title: Text("tozihat"),),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.comment), title: Text("nazarat")),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.panorama), title: Text("gallery")),
//
//          ],
//          onTap: (index) {
//            setState(() {
//              tab_index = index;
//            });
//          },
//          currentIndex: tab_index,
//        ),


      );

  }

  Widget _children(index) {
    List<Widget> page_screen = [];

    page_screen.add(_tozihat_screen());
    page_screen.add(_comment_screen());
    page_screen.add(_gallery_screen());


    return page_screen[index];
  }

  Widget _tozihat_screen() {

    double content_hight=(MediaQuery.of(context).size.height)-(MediaQuery.of(context).padding.top)-(AppBar().preferredSize.height)-20-250-50-(kBottomNavigationBarHeight)-70;


    return !title.isEmpty ? SingleChildScrollView(
        child: Column(children: <Widget>[

          Container(padding: EdgeInsets.only(top: 35),
            child:Row(children: <Widget>[
              Expanded(child: IconButton(icon: Icon(Icons.control_point_duplicate), onPressed: (){Navigator.pop(context);})),
              Expanded(child: IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: (){Navigator.pop(context);})),

            ],)

            ),

          Container(padding: EdgeInsets.only(top: 40,right: 40),child: Text(title,textAlign: TextAlign.right,style: TextStyle(fontSize: 30),),width: MediaQuery.of(context).size.width,),

          Image(image: NetworkImage(AppData.server_url+img_url),height: 250,),
            Container(child: Row(children: <Widget>[

              Container(margin: EdgeInsets.only(top: 15, right: 40) ,width : 80 ,child: Center(child: Text("مخلفات", style: TextStyle(fontSize: 20,color: Colors.grey),),),),
              Container(margin: EdgeInsets.only(top: 15, right: 40) ,width : 80 ,child: Center(child: Text("وزن/کیلو",style: TextStyle(fontSize: 20,color: Colors.grey),),),),
              Container(margin: EdgeInsets.only(top: 15, right: 40) ,width : 80 ,child: Center(child: Text("امتیاز",style: TextStyle(fontSize: 20,color: Colors.grey),),),),

            ],),),
          Container(child: Row(children: <Widget>[

//              Container(margin: EdgeInsets.only(top: 0, right: 30) , width : 120 , decoration : BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,border: Border.all(color: Colors.grey[200])),child:
//              Column(children: <Widget>[
//                CheckboxListTile(value: _checkBeforGerdoo, onChanged: _CheckGerdoo,title: Text('گردو'),),
//                CheckboxListTile(value: _checkBeforMoz, onChanged: _CheckMoz,title: Text('موز'),),
//                CheckboxListTile(value: _checkBeforEspanjsade, onChanged: _CheckEspanjsade,title: Text('اسپنج ساده'),),
//                CheckboxListTile(value: _checkBeforEspanjnescafe, onChanged: _CheckEspanjnescafe,title: Text('اسپنج نسکف'),),
//              ],),),
              Container(margin: EdgeInsets.only(top: 0, right: 40) ,height: 80, width : 80 , decoration : BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,border: Border.all(color: Colors.grey[200])),child: Center(child: Text("4",),),),
              Container(margin: EdgeInsets.only(top: 0, right: 40) ,height: 80, width : 80 , decoration : BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,border: Border.all(color: Colors.grey[200])),child: Center(child: Text("4",),),),
              Container(margin: EdgeInsets.only(top: 0, right: 40) ,height: 80, width : 80 , decoration : BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,border: Border.all(color: Colors.grey[200])),child: Center(child: Text("4",),),),

            ],),),



            Column(children: <Widget>[

              Container(margin: EdgeInsets.only(top: 10),child:Text(content),height: 50,),

              GestureDetector(onTap: (){

                Cart.add_product_cart(widget.product_id.toString(), title, int.parse(product_price), img_url).then((response){
//                  if(response){AppData.GoNewScreen(context, Cart_Screen(), -4, -2);}
                });},

                child:
//                Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)) ,color: Colors.green,),width: MediaQuery.of(context).size.width/2,height:50 ,child: Center(child: Row(mainAxisAlignment:MainAxisAlignment.center,children: <Widget>[
                Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)) ,color: Colors.green,),width: MediaQuery.of(context).size.width/2,height:50 ,child: Center(child: Row(mainAxisAlignment:MainAxisAlignment.center,children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("tooman "+ price ,style: TextStyle(color: Colors.white),),
                  ),Icon(Icons.add_shopping_cart,color: Colors.white,)


                ],),),) ,)

            ],)


        ],))

        : Container(child: Center(child: CircularProgressIndicator()));
  }

  Widget _comment_screen() {

//    return CommentForm(widget.product_id);

  return  Comments(widget.product_id,comment_list);



  }


  Widget _gallery_screen() {
    return Container(child: Center(child: CircularProgressIndicator(),));
  }


  _getProduct(int product_id,String url) async {





    await http.get(url).then((response) {
      if (response.statusCode == 200) {
        dynamic jsonResponse = convert.jsonDecode(response.body);



        setState(() {
          title = jsonResponse['title'];
          img_url = jsonResponse['img_url'];
          content = jsonResponse['content'];
          product_price = jsonResponse['price'];


          var formatter=new NumberFormat('###,###');

          price = formatter.format(int.parse(jsonResponse['price'].toString()));
        });
      }
    });

  }
  
  void _CheckGerdoo(bool valu){
      setState(() {
        if (valu==false){_checkBeforGerdoo= false;}
        if (valu==true){_checkBeforGerdoo= true;}
      });
      print(_checkBeforGerdoo);
  }void _CheckMoz(bool valu){
      setState(() {
        if (valu==false){_checkBeforMoz= false;}
        if (valu==true){_checkBeforMoz= true;}
      });
      print(_checkBeforMoz);
  }void _CheckEspanjnescafe(bool valu){
      setState(() {
        if (valu==false){_checkBeforEspanjnescafe= false;}
        if (valu==true){_checkBeforEspanjnescafe= true;}
      });
      print(_checkBeforEspanjnescafe);
  }void _CheckEspanjsade(bool valu){
      setState(() {
        if (valu==false){_checkBeforEspanjsade= false;}
        if (valu==true){_checkBeforEspanjsade= true;}
      });
      print(_checkBeforEspanjsade);
  }




}


