import 'package:test_market/Model/Boxes.dart';
import 'Comment.dart';
import 'Cups.dart';

class Shop {
  int id;
  int delivery_price;
  int shopcategory;
  double rate;
  bool active_status;
  String title;
  String img_url;
  List<String> active_time;
  List<String> icons;
  List<Comment> comments;
  List<Boxes> box;
  List<Cups> cup;

  Shop({this.id,this.rate,this.title,this.img_url,this.comments,this.delivery_price,this.active_status,this.active_time,this.icons,this.box,this.shopcategory});
}