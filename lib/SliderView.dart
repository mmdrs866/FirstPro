import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_market/AppData.dart';
import 'dart:convert' as convert;
import 'Model/AppSlider.dart';

List<Widget> sliders = [];
List<AppSlider> banner = [];
int slider_position=0;


class HomeSlider extends StatefulWidget {
  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {

  getSliders() {
    if (banner.length == 0) {
      var url = "http://192.168.43.159/flutter_app1/?action=get_sliders";

      http.get(url).then((response) {
        print(response.statusCode);

        if (response.statusCode == 200) {
          List jsonResponse = convert.jsonDecode(response.body);

          for (int i = 0; i < jsonResponse.length; i++) {
            setState(() {
              banner.add(AppSlider(
                img_url: jsonResponse[i]['img_url'],
              ));
            });
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    getSliders();

    return

      Container(
        child: banner.length>0 ?

        Stack(children: <Widget>[


          Container(margin: EdgeInsets.only(bottom: 10),
            child: PageView.builder(
              itemBuilder: (context, position) {
                return SlidersView(position);
              },
              itemCount: banner.length,
              onPageChanged: (position){
                setState(() {
                  slider_position=position;
                });




              },
            ),
          ),
          Container(height : 25,color: Colors.white54,child: Center(child: slider_pointer()





          ),margin: EdgeInsets.only(top: 160,left: 60,right: 60),)
        ],)


            :Center(
          child: CircularProgressIndicator(),
        ),
        height: 180,);



  }
}

Widget SlidersView(int position) {


  return Container(margin: EdgeInsets.only(left: 7,right: 7),child: Image(image: NetworkImage(AppData.server_url+banner[position].img_url,),fit: BoxFit.fill,));
}

Widget slider_pointer(){

  List<Widget> slider_pointer_item=[];


//    for(int i=0;i<banner.length;i++) {
//      slider_pointer_item.add(_midActive());
//
//      return Row(mainAxisAlignment: MainAxisAlignment.center,children: slider_pointer_item);
//    }
  for(int i=0;i<banner.length;i++){


//      slider_pointer_item.add(_Active());

    i==slider_position ? slider_pointer_item.add(_Active()) : slider_pointer_item.add(_inActive());


  }

  return Row(mainAxisAlignment: MainAxisAlignment.center,children: slider_pointer_item);
}


Widget _Active(){

  return Container(child: Image(image: NetworkImage(AppData.server_url+"Cakes/top.png")),decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10)),)
    ,width: 20,height: 20,);
}

Widget _inActive(){

  return Container(child: Image(image: NetworkImage(AppData.server_url+"Cakes/pank.png")),margin: EdgeInsets.only(left: 2,right: 2),decoration: BoxDecoration(

    borderRadius: BorderRadius.all(Radius.circular(10)),)
    ,width: 17,height: 17,);
}


//  Widget _midActive(){
//
//    return Container(decoration: BoxDecoration(
//    color: Colors.black.withAlpha(500),
//    borderRadius: BorderRadius.all(Radius.circular(10)),)
//    ,width: 15,height: 8,);
//  }

