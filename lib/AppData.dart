import 'package:flutter/material.dart';
class AppData{

  static String server_url="http://192.168.43.159/flutter_app1/";

  static GoNewScreen(BuildContext context, Widget screen, double a ,double b ){

    Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context,Animation<double> Animation,Animation<double> SecondAnimation){

      return screen;

    },

        transitionsBuilder: (BuildContext context,Animation<double> Animation,Animation<double> SecondAnimation,Widget child){

          return SlideTransition(position: new Tween<Offset>(begin: Offset(a,b),end: Offset.zero).animate(Animation),child: child,);

        }
        ,
        transitionDuration: Duration(milliseconds: 1000)

    ));

  }

}