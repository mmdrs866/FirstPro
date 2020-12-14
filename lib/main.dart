import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_market/screens/Cart.dart';
import 'package:test_market/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';




import 'AppData.dart';
import 'dart:async';


void main(){runApp(homeView());}


class homeView extends StatelessWidget {
  @override


    _incrementCounter() async {


//    Cart.add_product_cart("101", "2", 222, "img_url");
//        SharedPreferences prefs = await SharedPreferences.getInstance();
//        print(prefs.getString("products_id"));

//        Cart.empry_cart();
    }

    Widget build(BuildContext context) {
    _incrementCounter();


    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'firstfont'),
        localizationsDelegates: [
          // ... app-specific localization delegate[s] here
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('fa'), // farsi
        ],
        home: Material( color :Colors.white ,child:homePage()),

      );
  }
}

