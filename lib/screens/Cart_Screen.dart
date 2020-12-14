import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_market/AppData.dart';
import 'Cart.dart';
import 'package:intl/intl.dart';

class Cart_Screen extends StatefulWidget {

  @override
  Cart_View createState() => Cart_View();
}

class Cart_View extends State<Cart_Screen> {

  int cart_price=0;
  int total_all_price=0;


  Map<int,String> cart_product_id=Map();

  List<Map<String,dynamic>> product_data=[];

  Cart_View(){

    _getCartData();

  }


  @override
  Widget build(BuildContext context) {
    return Material(child: Scaffold(

      appBar: AppBar(title: Text("سبد خرید"),
          backgroundColor: Colors.indigo,
      elevation: 0,
      actions: <Widget>[

        product_data.length>0?
          IconButton(icon: Icon(Icons.delete),onPressed: (){
      AlertDialog alertdialog= AlertDialog(content: Text("آیا از خالی‌ کردن سبد خرید اطمینان دارید"),
        actions: <Widget>[

          RaisedButton(onPressed: (){
            Cart.empry_cart().then((response){

              Navigator.pop(context);
              if (response){

                setState(() {
                  product_data=[];
                });

              }

            });


          },child: Text("بله"),),
          RaisedButton(onPressed: (){Navigator.pop(context);},child: Text("خیر"),),

        ],);
      showDialog(context: context,builder: (BuildContext context)=>alertdialog);
    },)
            :Text('')

      ],),

      body:
      Column(children: <Widget>[
        Container(color: Colors.grey[300],height: MediaQuery.of(context).size.height-310,child:
        product_data.length>0?
        ListView.builder(itemBuilder: (context,index)=>_cartRow(index),itemCount: product_data.length,)
            : Center(child: Text("محصولی به سبد خرید اضافه نشده است"),),)
        ,

        Container(height: 100,child: Container(child: Column(children: <Widget>[
          Text("قیمت نهایی : " + total_all_price.toString()),
          Text("totalprice"),
          RaisedButton(child : Text("نهایی کردن خرید"),onPressed: null)

        ],),),)
      ],),



    ),);
  }

  _getCartData(){


    Cart.get_card_product().then((response){

      List<String> products_id=response.split("_");
      for(int i=0;i<(products_id.length-1);i++){


        String id=products_id[i];
        cart_product_id[i]=id;
        print(id);
        Cart.get_product_data(id).then((response){

          setState(() {
            total_all_price+=(response['price']*response['number']);
            product_data.add(response);
          });

        });
      }



    });

  }

  Widget _cartRow(int index){


    var formatter= new NumberFormat("###,###");

    String price_cart = formatter.format(product_data[index]['price']).toString()+ " تومان ";
    print(product_data[index]['price']);

    int total_price = product_data[index]['price']*product_data[index]['number'];
    print(total_all_price);
//    total_all_price = total_all_price + total_price;
    String total_price_cart = formatter.format(total_price).toString();


    return
      Container(height: 350,margin: EdgeInsets.all(10),decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,),
        child:

        Column(children: <Widget>[

          Row(children: <Widget>[

            Container(height:180,width: 180,margin: EdgeInsets.all(10),
                child:Expanded(child:Image(fit: BoxFit.fill,image: NetworkImage(AppData.server_url+product_data[index]['img_url'])))),

            Column(children: <Widget>[

              Text(product_data[index]['title']),

            ],)
//
          ],),
          Container(alignment: Alignment.centerRight,child: Container(margin: EdgeInsets.only(right: 10),width: 170 ,height: 40,decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.all(Radius.circular(20))),
            child:Row(
              children: <Widget>[

                IconButton(icon: Icon(Icons.delete_outline),onPressed: () {

                  Cart.change_number_product_less(cart_product_id[index]).then((response) {

                    if(response==1){

                      setState(() {
                        product_data[index]['number']=product_data[index]['number']-1;
                        total_all_price -= product_data[index]['price'];


                      });
                    }else if(response==0){
                      setState(() {
                        product_data[index]['number']=product_data[index]['number']-1;
                        product_data[index]['mood']=1;
                        total_all_price -= product_data[index]['price'];

                      });
                    }else if(response==-1){
                      setState(() {

                      });
                    }
                  });}),

                Container(height : 38,width : 70, decoration : BoxDecoration(color: Colors.red[100],borderRadius: BorderRadius.all(Radius.circular(20))),child: Center(child: Text("تعداد "+product_data[index]['number'].toString(),style: TextStyle(fontSize: 20),),),),

                IconButton(splashColor: Colors.green,icon: Icon(Icons.plus_one),onPressed: (){

                  Cart.change_number_product(cart_product_id[index]).then((response) {

                    if(response){

                      setState(() {
                        product_data[index]['number']=product_data[index]['number']+1;
                        product_data[index]['mood']=0;
                        total_all_price += product_data[index]['price'];

                      });
                    }
                  });
                  }),

              ],),),),




          Container(child: Text(price_cart)),

          Container(child: Text(total_price_cart)),

          product_data[index]['mood']==0?
          GestureDetector(child:
          Container(height : 38,width : 70, decoration : BoxDecoration(color: Colors.red[100],borderRadius: BorderRadius.all(Radius.circular(20))),child: Center(child: Text(" حذف محصول ",style: TextStyle(fontSize: 12),),),)
              ,onTap: (){

                Cart.remove_cart_product(cart_product_id[index]).then((response){

                  setState(() {
                    total_all_price -= product_data[index]['price']*product_data[index]['number'];
                    product_data.removeAt(index);

                  });});

              })
              :Container(child: Row(children: <Widget>[

            Expanded(child: GestureDetector(onTap: (){

              Cart.remove_cart_product(cart_product_id[index]).then((response){

                setState(() {
                  product_data.removeAt(index);
                });});

            },child: Container(height:45,color : Colors.red,child: Center(child:Text(" حذف محصول ")),)),),



            Expanded(child: GestureDetector(onTap: (){

              Cart.change_number_product(cart_product_id[index]).then((response) {

                if(response){

                  setState(() {
                    product_data[index]['number']=product_data[index]['number']+1;


                  });
                }
              });
              product_data[index]['mood']=0;

            },child: Container(height:45,color : Colors.green[400],child: Center(child: Text(" نگهداری در سبد خرید "),),)))




          ],),)
          ,


        ]));

  }



  _updateCartProductId(){

    Map<int,String> newCartData = Map();
    int i=0;

    cart_product_id.forEach((key, value) {

      newCartData[i]=value;
      i++;
    });

    cart_product_id=newCartData;


  }



}
