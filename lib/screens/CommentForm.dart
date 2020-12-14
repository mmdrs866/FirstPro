import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../AppData.dart';


class CommentForm extends StatefulWidget {

  int product_id;
  CommentForm(this.product_id);




  @override
  _CommentFormState createState() => _CommentFormState();
}

class _CommentFormState extends State<CommentForm> {

  int send =0;
  String _name="";
  String _email="";
  String _comment="";

  final _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Material(child: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.black.withAlpha(400),
          title: Text(
            "sabte nazar",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[


          ],
        )

    ,

    body:

    Stack(children: <Widget>[Container(child: Center(child:

    Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
          child: Form(key: _formkey, child: Column(children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(

                  onSaved: (String value){

                    _name = value;
                  }
                  ,
                  validator: (String value) {
                    if (value
                        .trim()
                        .isEmpty) {
                      return 'لطفا نام و نام خانوادگی خود را به درستی‌ وارد نمایید';
                    }
                  }
                  ,
                  decoration: InputDecoration(

                    labelText: 'نام و نام خانوادگی',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(
                        Radius.circular(5))),
                    prefixIcon: Icon(Icons.person, color: Colors.orange
                        .shade400,),

                  )),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  onSaved: (String value){

                    _email = value;
                  }
                  ,

                  validator: (String value) {
                    if (value
                        .trim()
                        .isEmpty) {
                      return 'لطفا ایمیل خود را به درستی‌ وارد نمایید';
                    }
                  }
                  ,

                  decoration: InputDecoration(

                    labelText: 'ایمیل',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(
                        Radius.circular(5))),
                    prefixIcon: Icon(Icons.email, color: Colors.orange.shade400),

                  )),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(

                onSaved: (String value){

                  _comment = value;
                }
                ,

                validator: (String value) {
                  if (value
                      .trim()
                      .isEmpty) {
                    return 'لطفا نطر خود را به درستی‌ وارد نمایید';
                  }
                }
                ,


                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 5,


                decoration: InputDecoration(
                  labelText: 'نطر',
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(
                      Radius.circular(5))),
                  prefixIcon: Icon(Icons.comment, color: Colors.orange.shade400),

                ),),
            ),


            ButtonTheme(child: RaisedButton(onPressed: () {

              if(_formkey.currentState.validate()){



                _formkey.currentState.save();

                setState(() {
                  send=1;
                });

                _send_comment_data();




              }

            },
              child: Text("submit", style: TextStyle(color: Colors.white),),
              color: Colors.green,
              splashColor: Colors.orange.shade400,)
              , height: 45, minWidth: MediaQuery
                  .of(context)
                  .size
                  .width,)

          ],
          )
          )
      ),
    )
      ,)
    )
      ,
      send==1?  Opacity(opacity: 0.3,child:       Container(color : Colors.white,child: Center(child: CircularProgressIndicator(),),),)  : Text("")

      ,]
      ,)


    ),);
  }

  _send_comment_data(){

    String url = AppData.server_url+"?action=add_comment&product_id="+widget.product_id.toString();
    http.post(url,body: {"name":_name,"email":_email,"comment":_comment}).then((response){

      print(response.body);

      setState(() {
        send=0;
        _formkey.currentState.reset();
      });


    });

  }

}
