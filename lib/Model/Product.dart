import 'package:test_market/Model/PriceTedad.dart';
import 'package:test_market/screens/Comments.dart';

class Product {
  int id;
  int price;
  int darsad_takhfif;
  int saghfekharid;
  int category_type;
  double rate;
  bool active_product_status;
  bool cake_sefareshi;
  String title;
  String img;
  String tozihat;
  List<Comments> comment;
  List<PriceTedad> pricetedad;
  List<Product> offers;




  Product({this.id,this.price,this.darsad_takhfif,this.active_product_status,this.rate,this.title,this.img,this.tozihat,this.comment,this.offers,this.cake_sefareshi,this.pricetedad});
}
