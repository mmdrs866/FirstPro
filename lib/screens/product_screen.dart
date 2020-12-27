import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:test_market/Model/Boxes.dart';
import 'package:test_market/Model/PriceTedad.dart';
import 'package:test_market/Model/Product.dart';
import 'dart:convert' as convert;




class ProductPage extends StatefulWidget {

  int product_id;
  List<Boxes> shopboxdetails;


  ProductPage(int id,List<Boxes> boxes){

    product_id=id;
    shopboxdetails=boxes;
    for(int i=0; i<shopboxdetails.length;i++){shopboxdetails[i].chekbox=false;}

//    this.title = title.length>25 ? title.substring(0,30)+"..." : title ;


  }

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {


  Product thisproduct = new Product();

  var _checkBeforGerdoo=false;
  var _checkBeforMoz=false;
  var _checkBeforEspanjnescafe=false;
  var _checkBeforEspanjsade=false;

  int boxeselectedindex=null;
  bool _visible=true;





  @override
  Widget build(BuildContext context) {



    thisproduct.id=1;
    thisproduct.price=27500;
    thisproduct.darsad_takhfif=20;
    thisproduct.category_type=0;
    thisproduct.saghfekharid=6;
    thisproduct.rate=4.5;
    thisproduct.active_product_status=true;
    thisproduct.title="ساق عروس مافین";
    thisproduct.img="http://192.168.43.159/flutter_app1/Shirini_Khoshk/5.png";
    thisproduct.tozihat="کیک هویج بصورت اسلایسی یا برشی مبیاشد";
    List<PriceTedad> pt =[];
    pt.add(new PriceTedad(price: 4000,tedad: 3,vazn: 0.5,radifi: true));
    pt.add(new PriceTedad(price: 12000,tedad: 8,vazn: 0.5,radifi: false));
    pt.add(new PriceTedad(price: 5500,tedad: 4,vazn: 1,radifi: true));
    pt.add(new PriceTedad(price: 24000,tedad: 16,vazn: 1,radifi: false));
    pt.add(new PriceTedad(price: 7300,tedad: 5,vazn: 2,radifi: true));
    pt.add(new PriceTedad(price: 44000,tedad: 36,vazn: 2,radifi: false));


    thisproduct.pricetedad=pt;
    thisproduct.comment;
    thisproduct.offers;
    thisproduct.cake_sefareshi;





    return Scaffold(
      body: (Product_page()),

        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new FloatingActionButton.extended(
              backgroundColor: Colors.green[600],
              foregroundColor: Colors.white,
              label: Text('اضافه به فرایند خرید',style: TextStyle(fontSize: 20),),
              icon: Icon(Icons.add),
              onPressed: () {      showDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return AlertDialog(
                        content: StatefulBuilder(
                            builder: (context,setState){return Container(
                                child: Stack(
                                    overflow: Overflow.visible,
                                    children: <Widget>[
                                      Positioned(
                                        right: -40.0,
                                        top: -40.0,
                                        child: InkResponse(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: CircleAvatar(
                                            child: Icon(Icons.close),
                                            backgroundColor: Colors.red,
                                          ),
                                        ),
                                      ),
                                      SingleChildScrollView(child: Sefareshtyp0(),),]));})
                      );
                    },
                  );
                },
              );},
            ),
          ],
        )




    );

  }


  Widget Product_page() {
//    _getProduct(widget.product_id);

    var formatter=new NumberFormat('###,###');
      double content_hight=(MediaQuery.of(context).size.height)-(MediaQuery.of(context).padding.top)-(AppBar().preferredSize.height)-20-250-50-(kBottomNavigationBarHeight)-70;

      dynamic w= (MediaQuery.of(context).size.width-240)/4;

    return !thisproduct.title.isEmpty
        ? SingleChildScrollView(
        child: Column(children: <Widget>[

          Container(padding: EdgeInsets.only(top: 35),
            child:Row(children: <Widget>[
              Expanded(child: IconButton(icon: Icon(Icons.control_point_duplicate), onPressed: (){Navigator.pop(context);})),
              Expanded(child: IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: (){Navigator.pop(context);})),

            ],)

            ),

          Container(padding: EdgeInsets.only(top: 40,right: 40),child: Text(thisproduct.title,textAlign: TextAlign.right,style: TextStyle(fontSize: 30),),width: MediaQuery.of(context).size.width,),

          Image(image: NetworkImage(thisproduct.img),height: 250,),
            Container(child: Row(children: <Widget>[

              Container(margin: EdgeInsets.only(top: 15, right: w) ,width : 80 ,child: Center(child: Text("قیمت", style: TextStyle(fontSize: 20,color: Colors.grey),),),),
              Container(margin: EdgeInsets.only(top: 15, right: w,left: w) ,width : 80 ,child: Center(child: Text("امتیاز",style: TextStyle(fontSize: 20,color: Colors.grey),),),),
              Container(margin: EdgeInsets.only(top: 15, left: w) ,width : 80 ,child: Center(child: Text("وضعیت",style: TextStyle(fontSize: 20,color: Colors.grey),),),),

            ],),),
          Container(child: Row(children: <Widget>[

//              Container(margin: EdgeInsets.only(top: 0, right: 30) , width : 120 , decoration : BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,border: Border.all(color: Colors.grey[200])),child:
//              Column(children: <Widget>[
//                CheckboxListTile(value: _checkBeforGerdoo, onChanged: _CheckGerdoo,title: Text('گردو'),),
//                CheckboxListTile(value: _checkBeforMoz, onChanged: _CheckMoz,title: Text('موز'),),
//                CheckboxListTile(value: _checkBeforEspanjsade, onChanged: _CheckEspanjsade,title: Text('اسپنج ساده'),),
//                CheckboxListTile(value: _checkBeforEspanjnescafe, onChanged: _CheckEspanjnescafe,title: Text('اسپنج نسکف'),),
//              ],),),
              Stack(
                children: <Widget>[
                  thisproduct.darsad_takhfif==0
                  ?Text("")
                  :Container(margin: EdgeInsets.only(top: 20, right: w) ,height: 80, width : 80 , decoration : BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.red),
                    child:Container(alignment:Alignment.bottomCenter,child: Text(thisproduct.darsad_takhfif.toString()+"% تخفیف", style: TextStyle(fontSize: 12,color: Colors.white),))),

                  Container(margin: EdgeInsets.only(top: 0, right: w) ,height: 80, width : 80 , decoration : BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,border: Border.all(color: thisproduct.darsad_takhfif==0?Colors.grey[200]:Colors.red)),child: Center(
                    child: thisproduct.darsad_takhfif==0
                        ?Text(formatter.format(thisproduct.price).toString(),style: TextStyle(fontSize: 16),)
                        :Column(children: <Widget>[
                          Container(margin: EdgeInsets.only(top: 15),child: Text(formatter.format(thisproduct.price).toString(),style: TextStyle(fontSize: 14,color: Colors.grey[400],decoration: TextDecoration.lineThrough),)),
                          Container(margin: EdgeInsets.only(top: 6),child: Text(formatter.format(thisproduct.price/100*(100-thisproduct.darsad_takhfif)).toString(),style: TextStyle(fontSize: 17),)),
                    ],),),)

                ],
              ),
              Container(margin: EdgeInsets.only(bottom: thisproduct.darsad_takhfif==0?0:20, right: w,left: w) ,height: 80, width : 80 , decoration : BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,border: Border.all(color: Colors.grey[200])),child: Center(
                child: Text(thisproduct.rate.toString(),style: TextStyle(fontSize: 17),),),),

              Container(margin: EdgeInsets.only(bottom: thisproduct.darsad_takhfif==0?0:20, left: w) ,height: 80, width : 80 , decoration : BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,border: Border.all(color: Colors.grey[200])),child: Center(
                child: Column(children: <Widget>[
                  Container(margin:EdgeInsets.only(top: 5),height:40,child: Image(image: NetworkImage(thisproduct.active_product_status==true?"http://192.168.43.159/flutter_app1/logo/avalible.png":"http://192.168.43.159/flutter_app1/logo/unavalible.png"),),),
                  Text(thisproduct.active_product_status==true?"آماده ارسال": "نامجود")

                ],),),),

            ],),),



            Container(margin: EdgeInsets.only(top: 10),child:Text(thisproduct.tozihat),),

          Container(
              height: thisproduct.pricetedad.length.toDouble()*110,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: pricetedadlist,
                itemCount: thisproduct.pricetedad.length,),)
            
//            Container(
//              child: Column(
//                children: <Widget>[
//                  Container(child: Text("محصولات پیشنهادی"),),
//                  Container(
//                    height: 250,
//                    child: ListView.builder(
//                        scrollDirection: Axis.horizontal,
//                        itemCount: thisproduct.offers.length,
//                        itemBuilder: PishnahadiList
//                    ),)
//
//
//                ],),),





        ],))

        : Container(child: Center(child: CircularProgressIndicator()));

  }


  Widget pricetedadlist(context, index){
    var formatter=new NumberFormat('###,###');
    
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              thisproduct.pricetedad[index].radifi==false
                ?Column(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
                  Container(margin:EdgeInsets.only(right: 15),child: Text(" قیمت در جعبه " + thisproduct.pricetedad[index].vazn.toString() + " کیلویی " ,style: TextStyle(fontSize: 17),)),
                  Container(margin:EdgeInsets.only(right: 15),child: Text( " تعداد : حدودا " + thisproduct.pricetedad[index].tedad.toString() + " عدد",style: TextStyle(fontSize: 15))),
              ],)
                :Column(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
                    Container(margin:EdgeInsets.only(right: 15),child: Text(" قیمت یک ردیف در جعبه " + thisproduct.pricetedad[index].vazn.toString() + " کیلویی ",style: TextStyle(fontSize: 17))),
                    Container(margin:EdgeInsets.only(right: 15),child: Text(" تعداد : حدودا " + thisproduct.pricetedad[index].tedad.toString() + " عدد",style: TextStyle(fontSize: 15))),
              ],),

            Stack(
              children: <Widget>[
                thisproduct.darsad_takhfif==0
                    ?Text("")
                    :Container(margin: EdgeInsets.only(top: 20,left: 30) ,height: 55, width : 70 , decoration : BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.red),
                    child:Container(alignment:Alignment.bottomCenter,child: Text(thisproduct.darsad_takhfif.toString()+"% تخفیف", style: TextStyle(fontSize: 12,color: Colors.white),))),

                Container(margin: EdgeInsets.only(top: 0,left: 30,bottom: thisproduct.darsad_takhfif==0?20:0) ,height: thisproduct.darsad_takhfif==0?65:55, width : 70 , decoration : BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,border: Border.all(color: thisproduct.darsad_takhfif==0?Colors.grey[200]:Colors.red)),child: Center(
                  child: thisproduct.darsad_takhfif==0
                      ?Text(formatter.format(thisproduct.pricetedad[index].price).toString(),style: TextStyle(fontSize: 16),)
                      :Column(children: <Widget>[
                    Container(margin: EdgeInsets.only(top: 8),child: Text(formatter.format(thisproduct.pricetedad[index].price).toString(),style: TextStyle(fontSize: 14,color: Colors.grey[400],decoration: TextDecoration.lineThrough),)),
                    Container(margin: EdgeInsets.only(top: 3),child: Text(formatter.format(thisproduct.pricetedad[index].price/100*(100-thisproduct.darsad_takhfif)).toString(),style: TextStyle(fontSize: 17),)),
                  ],),),)

              ],
            )
          ],),
          Divider(endIndent: 40,indent: 40,)
        ],
      ),
    );
    
  }

  _getProduct(int product_id) async {


      var url = "http://192.168.43.159/flutter_app1/?action=" + product_id.toString();
    await http.get(url).then((response) {
      if (response.statusCode == 200) {
        dynamic jsonResponse = convert.jsonDecode(response.body);

        setState(() {
          thisproduct.price = jsonResponse['price'];
          thisproduct.darsad_takhfif = jsonResponse['darsadtakhfif'];
          thisproduct.active_product_status = jsonResponse['activestatus'];
          thisproduct.title = jsonResponse['title'];
          thisproduct.img = jsonResponse['img'];
          thisproduct.tozihat = jsonResponse['tozihat'];
          thisproduct.comment = jsonResponse['comment'];
          thisproduct.pricetedad = jsonResponse['pricetedad'];
          thisproduct.offers = jsonResponse['offers'];
          thisproduct.cake_sefareshi = jsonResponse['cakesefareshi'];
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

  Widget PishnahadiList(BuildContext context, int index) {
    return Pishnahadi(context,index, thisproduct.offers);
  }

  Widget Pishnahadi(context,int index, List<Product> list) {


    String pricee = "";
    String toman = " تومان ";
    var formatter = new NumberFormat("###,###");
    pricee = formatter.format(thisproduct.price) + toman;
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

      ,onTap: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> ProductPage(list[index].id,widget.shopboxdetails)));},);
  }


//    return GestureDetector(onTap: (){
//
////                Cart.add_product_cart(widget.product_id.toString(), title, int.parse(product_price), img_url).then((value){});
//    },
//      child:
////                Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)) ,color: Colors.green,),width: MediaQuery.of(context).size.width/2,height:50 ,child: Center(child: Row(mainAxisAlignment:MainAxisAlignment.center,children: <Widget>[
//      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)) ,color: Colors.green,),width: MediaQuery.of(context).size.width/2,height:50 ,child: Center(child: Row(mainAxisAlignment:MainAxisAlignment.center,children: <Widget>[
//
//        Padding(
//          padding: const EdgeInsets.only(left: 10),
//          child: Text("tooman "+ thisproduct.price.toString() ,style: TextStyle(color: Colors.white),),
//        ),Icon(Icons.add_shopping_cart,color: Colors.white,)
//
//
//      ],),),) ,);

  radifselected(context,List<PriceTedad> list,double selectedvazn,int maxzarfiat){
    var formatter=new NumberFormat('###,###');
    int gheymate_kol=0;
    int tedade_kol=0;
    int tedade_sefaresh=1;
    int indexvazn;

    for(int i = 0; i<list.length;i++){
      if(list[i].radifi==true){
        if(list[i].vazn==selectedvazn){
          gheymate_kol=list[i].price;
          tedade_kol=list[i].tedad;
          indexvazn=i;
        }
      }
    }

    return StatefulBuilder(builder: (context,setState){return Center(
      child: Column(

        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(margin: EdgeInsets.only(left: 5),height:75,child: Image(image: NetworkImage(thisproduct.img)),),
              Container(
                margin: EdgeInsets.only(right: 5),
                child: Stack(
                  children: <Widget>[
                    thisproduct.darsad_takhfif==0
                        ?Text("")
                        :Container(margin: EdgeInsets.only(top: 40,left: 0) ,height: 55, width : 70 , decoration : BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.red),
                        child:Container(alignment:Alignment.bottomCenter,child: Text(thisproduct.darsad_takhfif.toString()+"% تخفیف", style: TextStyle(fontSize: 12,color: Colors.white),))),

                    Container(margin: EdgeInsets.only(top: 20,left: 0,bottom: thisproduct.darsad_takhfif==0?20:0) ,height: thisproduct.darsad_takhfif==0?65:55, width : 70 , decoration : BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,border: Border.all(color: thisproduct.darsad_takhfif==0?Colors.grey[200]:Colors.red)),child: Center(
                      child: thisproduct.darsad_takhfif==0
                          ?Text(formatter.format(gheymate_kol).toString(),style: TextStyle(fontSize: 16),)
                          :Column(children: <Widget>[
                        Container(margin: EdgeInsets.only(top: 8),child: Text(formatter.format(gheymate_kol).toString(),style: TextStyle(fontSize: 14,color: Colors.grey[400],decoration: TextDecoration.lineThrough),)),
                        Container(margin: EdgeInsets.only(top: 3),child: Text(formatter.format(gheymate_kol/100*(100-thisproduct.darsad_takhfif)).toString(),style: TextStyle(fontSize: 17),)),
                      ],),),)

                  ],
                ),
              ),
            ],
          ),
          Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(icon: Icon(Icons.add), onPressed:  (){setState(() {tedade_sefaresh==maxzarfiat?null:gheymate_kol=gheymate_kol+(gheymate_kol/tedade_sefaresh).round();tedade_sefaresh==maxzarfiat?null:tedade_sefaresh+=1;});}),
                Text(tedade_sefaresh.toString()+"/"+maxzarfiat.toString()),
                IconButton(icon: Icon(Icons.remove), onPressed: (){setState(() {tedade_sefaresh==1?null:gheymate_kol=gheymate_kol-(gheymate_kol/tedade_sefaresh).round();tedade_sefaresh==1?null:tedade_sefaresh-=1;});})

              ],),),
          Container(child: Text("هر ردیف حدودا شامل :" + list[indexvazn].tedad.toString() +"عدد",style: TextStyle(fontSize: 15,color: Colors.grey[700]),),),
          Container(child: Text("ظرفیت جعبه:" + maxzarfiat.toString() +"ردیف",style: TextStyle(fontSize: 15,color: Colors.grey[700]),),),

          RaisedButton(
            child: Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: <Widget>[
                Text("اضافه به سبد خرید  ",style: TextStyle(color: Colors.white),),
                Icon(Icons.add_shopping_cart,color: Colors.white,),
              ],
            ),
            onPressed: (){int i = 0;},
            color: Colors.green[500],
              ),


        ],
      ),
    );},

    );
  }

  kiloselected(List<PriceTedad> list,double selectedvazn,){

    var formatter=new NumberFormat('###,###');
    int gheymate_kol=0;


    for(int i = 0; i<list.length;i++){
      if(list[i].radifi==false){
        if(list[i].vazn==selectedvazn){
          gheymate_kol=list[i].price;
        }
      }
    }

    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(margin: EdgeInsets.only(left: 5),height:75,child: Image(image: NetworkImage(thisproduct.img)),),
          Container(
            margin: EdgeInsets.only(right: 5),
            child: Stack(
              children: <Widget>[
                thisproduct.darsad_takhfif==0
                    ?Text("")
                    :Container(margin: EdgeInsets.only(top: 40,left: 0) ,height: 55, width : 70 , decoration : BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.red),
                    child:Container(alignment:Alignment.bottomCenter,child: Text(thisproduct.darsad_takhfif.toString()+"% تخفیف", style: TextStyle(fontSize: 12,color: Colors.white),))),

                Container(margin: EdgeInsets.only(top: 20,left: 0,bottom: thisproduct.darsad_takhfif==0?20:0) ,height: thisproduct.darsad_takhfif==0?65:55, width : 70 , decoration : BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,border: Border.all(color: thisproduct.darsad_takhfif==0?Colors.grey[200]:Colors.red)),child: Center(
                  child: thisproduct.darsad_takhfif==0
                      ?Text(formatter.format(gheymate_kol).toString(),style: TextStyle(fontSize: 16),)
                      :Column(children: <Widget>[
                    Container(margin: EdgeInsets.only(top: 8),child: Text(formatter.format(gheymate_kol).toString(),style: TextStyle(fontSize: 14,color: Colors.grey[400],decoration: TextDecoration.lineThrough),)),
                    Container(margin: EdgeInsets.only(top: 3),child: Text(formatter.format(gheymate_kol/100*(100-thisproduct.darsad_takhfif)).toString(),style: TextStyle(fontSize: 17),)),
                  ],),),)

              ],
            ),
          ),
        ],
      ),
      
      Container(margin:EdgeInsets.only(top: 10),child: Text("سفارش یک جعبه "+ selectedvazn.toString() +"کیلویی‌ از این محصول",textAlign: TextAlign.center,),),
      RaisedButton(
        child: Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: <Widget>[
            Text("اضافه به سبد خرید  ",style: TextStyle(color: Colors.white),),
            Icon(Icons.add_shopping_cart,color: Colors.white,),
          ],
        ),
        onPressed: (){int i = 0;},
        color: Colors.green[500],
      )

    ],);
  }


//  category shirini
  Sefareshtyp0(){


    return StatefulBuilder(
      builder: (context,setState){return Container(
        child: Container(child: Column(children: <Widget>[

          Container(
            child: Column(children: <Widget>[
              Container(
                color: Colors.green[100],
                child: Text("ابتدا ظرفیت جعبه شیرینی‌ مورد نظر خود را انتخاب کنید",textAlign: TextAlign.center,),),
              Container(
                height: (widget.shopboxdetails.length*50).roundToDouble(),
                width: MediaQuery.of(context).size.width/100*80,
                child: ListView.builder(
                    itemCount: widget.shopboxdetails.length,
                    itemBuilder: (BuildContext,index){
                      return Row(children: <Widget>[
                        Text("جعبه" + widget.shopboxdetails[index].vazn_jabe.toString() + " کیلویی‌: ظرفیت " + widget.shopboxdetails[index].tedade_radif_jabe.toString()+"ردیف"),
                        Checkbox(
                            value: this.widget.shopboxdetails[index].chekbox,
                            onChanged: (bool value) {setState(() {
                              for(int i=0 ; i<widget.shopboxdetails.length;i++){
                                widget.shopboxdetails[i].chekbox=false;}
                              this.widget.shopboxdetails[index].chekbox=value;
                              boxeselectedindex = index;

                            });})

                      ],);}),),
              RaisedButton(
                onPressed: boxeselectedindex==null?null:() {setState(() {if(_visible==true){_visible = !_visible;};});},
                child: boxeselectedindex==null
                    ?Text("جعبه را انتخاب کنید",style: TextStyle(color: Colors.white))
                    :Text("تائید جعبه"+ widget.shopboxdetails[boxeselectedindex].vazn_jabe.toString()+" کیلویی‌",style: TextStyle(color: Colors.white)),
                elevation: boxeselectedindex==null?0:4,
                color: boxeselectedindex==null?Colors.grey:Colors.green,
              ),
              Container(height: 20,),

              AnimatedOpacity(
                // If the widget is visible, animate to 0.0 (invisible).
                // If the widget is hidden, animate to 1.0 (fully visible).
                  opacity: _visible ? 0.15 : 1.0,
                  duration: Duration(milliseconds: 500),
                  // The green box must be a child of the AnimatedOpacity widget.
                  child: Container(
                    height: 450,
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: <Widget>[
                      Container(color: Colors.green[100],child: Text("به صورت ردیفی‌ سفارش میدهید یا کیلویی‌ ؟",textAlign: TextAlign.center,),),
                      Container(
                        child: DefaultTabController(
                            length: 2, // length of tabs
                            initialIndex: 0,
                            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                              Container(
                                child: TabBar(
                                  labelColor: Colors.green,
                                  unselectedLabelColor: Colors.black,
                                  tabs: [
                                    Tab(text: 'ردیفی‌'),
                                    Tab(text: 'کیلویی‌'),
                                  ],
                                ),
                              ),
                              Container(
                                  height: 300, //height of TabBarView
                                  decoration: BoxDecoration(
                                    border: Border(top: BorderSide(color: Colors.grey, width: 0.5),),
                                  ),
                                  child: TabBarView(children: <Widget>[
                                    Container(child: radifselected(context,thisproduct.pricetedad,widget.shopboxdetails[boxeselectedindex==null?0:boxeselectedindex].vazn_jabe,widget.shopboxdetails[boxeselectedindex==null?0:boxeselectedindex].tedade_radif_jabe),),
                                    Container(child: kiloselected(thisproduct.pricetedad,widget.shopboxdetails[boxeselectedindex==null?0:boxeselectedindex].vazn_jabe)),

                                  ])
                              )
                            ])
                        ),
                      ),
                    ],),)
              ),
            ],),)

        ],),),
      ) ; },
    );

  }

  //  category donat shirini doneyi va deser doneyi finger food
  Sefareshtyp1(){
    var formatter=new NumberFormat('###,###');
    int gheymate_kol= thisproduct.price;
    int tedade_sefaresh = 1;
    int maxzarfiat = thisproduct.saghfekharid;


    return StatefulBuilder(
        builder: (context,setState){return Container(
            child: Column(children: <Widget>[


              Container(
                color: Colors.green[100],
                child: Text("  تعداد محصول را انتخاب کنید  ",textAlign: TextAlign.center),),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(margin: EdgeInsets.only(left: 5),height:75,child: Image(image: NetworkImage(thisproduct.img)),),
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    child: Stack(
                      children: <Widget>[
                        thisproduct.darsad_takhfif==0
                            ?Text("")
                            :Container(margin: EdgeInsets.only(top: 40,left: 0) ,height: 55, width : 70 , decoration : BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.red),
                            child:Container(alignment:Alignment.bottomCenter,child: Text(thisproduct.darsad_takhfif.toString()+"% تخفیف", style: TextStyle(fontSize: 12,color: Colors.white),))),

                        Container(margin: EdgeInsets.only(top: 20,left: 0,bottom: thisproduct.darsad_takhfif==0?20:0) ,height: thisproduct.darsad_takhfif==0?65:55, width : 70 , decoration : BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,border: Border.all(color: thisproduct.darsad_takhfif==0?Colors.grey[200]:Colors.red)),child: Center(
                          child: thisproduct.darsad_takhfif==0
                              ?Text(formatter.format(gheymate_kol).toString(),style: TextStyle(fontSize: 16),)
                              :Column(children: <Widget>[
                            Container(margin: EdgeInsets.only(top: 8),child: Text(formatter.format(gheymate_kol).toString(),style: TextStyle(fontSize: 14,color: Colors.grey[400],decoration: TextDecoration.lineThrough),)),
                            Container(margin: EdgeInsets.only(top: 3),child: Text(formatter.format(gheymate_kol/100*(100-thisproduct.darsad_takhfif)).toString(),style: TextStyle(fontSize: 17),)),
                          ],),),)

                      ],
                    ),
                  ),
                  Container(child:Text(" تومان  ",style: TextStyle(color: Colors.grey[400],fontSize: 20),))
                ],
              ),
              Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.add), onPressed:  (){setState(() {tedade_sefaresh==maxzarfiat?null:gheymate_kol=gheymate_kol+(gheymate_kol/tedade_sefaresh).round();tedade_sefaresh==maxzarfiat?null:tedade_sefaresh+=1;});}),
                    Text(tedade_sefaresh.toString()+"/"+maxzarfiat.toString()),
                    IconButton(icon: Icon(Icons.remove), onPressed: (){setState(() {tedade_sefaresh==1?null:gheymate_kol=gheymate_kol-(gheymate_kol/tedade_sefaresh).round();tedade_sefaresh==1?null:tedade_sefaresh-=1;});})

                  ],),),
              Container(child: Text("سفارش:"+tedade_sefaresh.toString()+"عدد ",textAlign: TextAlign.center,),),

              RaisedButton(
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: <Widget>[
                    Text("اضافه به سبد خرید  ",style: TextStyle(color: Colors.white),),
                    Icon(Icons.add_shopping_cart,color: Colors.white,),
                  ],
                ),
                onPressed: (){int i = 0;},
                color: Colors.green[500],
              )

              
            ],));});
  }

  //  category keyk rooz
  Sefareshtyp2(){
    var formatter=new NumberFormat('###,###');
    int gheymate_kol = thisproduct.price;


    return StatefulBuilder(
        builder: (context,setState){return Container(
            child: Column(children: <Widget>[

              Container(color: Colors.green[100],child: Text("سفارش کیک روز    ",textAlign: TextAlign.center,),),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(margin: EdgeInsets.only(left: 5),height:75,child: Image(image: NetworkImage(thisproduct.img)),),
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    child: Stack(
                      children: <Widget>[
                        thisproduct.darsad_takhfif==0
                            ?Text("")
                            :Container(margin: EdgeInsets.only(top: 40,left: 0) ,height: 55, width : 70 , decoration : BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.red),
                            child:Container(alignment:Alignment.bottomCenter,child: Text(thisproduct.darsad_takhfif.toString()+"% تخفیف", style: TextStyle(fontSize: 12,color: Colors.white),))),

                        Container(margin: EdgeInsets.only(top: 20,left: 0,bottom: thisproduct.darsad_takhfif==0?20:0) ,height: thisproduct.darsad_takhfif==0?65:55, width : 70 , decoration : BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,border: Border.all(color: thisproduct.darsad_takhfif==0?Colors.grey[200]:Colors.red)),child: Center(
                          child: thisproduct.darsad_takhfif==0
                              ?Text(formatter.format(gheymate_kol).toString(),style: TextStyle(fontSize: 16),)
                              :Column(children: <Widget>[
                            Container(margin: EdgeInsets.only(top: 8),child: Text(formatter.format(gheymate_kol).toString(),style: TextStyle(fontSize: 14,color: Colors.grey[400],decoration: TextDecoration.lineThrough),)),
                            Container(margin: EdgeInsets.only(top: 3),child: Text(formatter.format(gheymate_kol/100*(100-thisproduct.darsad_takhfif)).toString(),style: TextStyle(fontSize: 17),)),
                          ],),),)

                      ],
                    ),
                  ),
                  Container(child:Text(" تومان  ",style: TextStyle(color: Colors.grey[400],fontSize: 20),))
                ],
              ),

              Container(child: Text(thisproduct.tozihat,style: TextStyle(color: Colors.grey[700]),textAlign: TextAlign.center),),
              Container(height: 20,child: Text(""),),


              RaisedButton(
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: <Widget>[
                    Text("اضافه به سبد خرید  ",style: TextStyle(color: Colors.white),),
                    Icon(Icons.add_shopping_cart,color: Colors.white,),
                  ],
                ),
                onPressed: (){int i = 0;},
                color: Colors.green[500],
              )
            ],));});
  }

  //  category keyk sefareshi
  Sefareshtyp3(){


    return StatefulBuilder(
        builder: (context,setState){return Container(
            child: Text(""));});
  }

  //  category ghahve
  Sefareshtyp4(){


    return StatefulBuilder(
        builder: (context,setState){return Container(
            child: Text(""));});
  }



  }


