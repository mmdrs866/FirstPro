import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:test_market/AppData.dart';
import 'package:test_market/screens/CommentForm.dart';

class Comments extends StatefulWidget {


  List <dynamic> comment_list;
  int product_id;

  Comments(this.product_id,this.comment_list);

  @override
  CommentView createState() => CommentView(product_id,comment_list);
}

class CommentView extends State<Comments> {
  int page=1;
  int more_data=1;

  ScrollController _ScrollController = new ScrollController();

  void initState(){

    _ScrollController.addListener(() {

      if(_ScrollController.position.pixels==_ScrollController.position.maxScrollExtent){

        _loadData(widget.product_id);

      }
    });
  }

  CommentView(product_id,List <dynamic> comment_list){

    if(comment_list.length==0){
      _loadData(product_id);

    }
  }

  @override
  Widget build(BuildContext context) {

    int itemCount=more_data==1?widget.comment_list.length+1:widget.comment_list.length;

    return widget.comment_list.length>0 ?

    Stack(children: <Widget>[
      ListView.builder(
        controller:_ScrollController,
        itemBuilder: (BuildContext_context,index){
          return comment_row(index);
        },itemCount: itemCount,)
      ,
      Positioned(child: FloatingActionButton(onPressed: (){

/*
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>CommentForm(widget.product_id)));
*/
      
      AppData.GoNewScreen(context, CommentForm(widget.product_id), 0, 1);
      
      },splashColor: Colors.green,child: Icon(Icons.add,size: 50,color: Colors.grey[200],),backgroundColor: Colors.blue,),bottom: 25,right: 25,)

    ],)

        :

        Container(child: Center(child: CircularProgressIndicator(),),)
        ;
  }
  
  Widget comment_row(int index){

    double w=MediaQuery.of(context).size.width-30;

    print(index+widget.comment_list.length);
    if (index==widget.comment_list.length) {

      return Container(height: 100,width: w,child: Center(child: CircularProgressIndicator(),),);

    }   else {

      return Container(decoration:BoxDecoration(border: Border.all(color: Colors.grey[350],width: 1)),margin: EdgeInsets.all(15),child: Column(children: <Widget>[

        Container(padding: EdgeInsets.all(10),width:w,color: Colors.grey[200],
          child: Row(children: <Widget>[
            Expanded(child: Text(widget.comment_list[index]['name'])),
            Expanded(child: Text(" تاریخ "+widget.comment_list[index]['date'],textAlign: TextAlign.right,),)
            ,],)

          ,)
        ,Container(padding: EdgeInsets.only(left: 10,right: 10),width:w,color: Colors.white,child: Text(widget.comment_list[index]['content']),)

        ,],),);

    }
  }

  void _loadData(int product_id){

    String url=AppData.server_url+"?action=get_comment&product_id="+product_id.toString()+"&page="+page.toString();

    http.get(url).then((response){

      if (response.statusCode==200){

        setState((){

          if (response.body=="[]"){
            more_data=0;
          }
          else {
            widget.comment_list =
                widget.comment_list + convert.jsonDecode(response.body);
          }});

        page=page+1;

      }
    });

  }
  
}
