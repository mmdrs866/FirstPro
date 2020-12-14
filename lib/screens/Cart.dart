import 'package:shared_preferences/shared_preferences.dart';

class Cart{

  static Future<bool> add_product_cart(String product_id, String title, int price,String img_url) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

//    prefs.remove('products_id');

    String products_id=prefs.getString("products_id");

    if(products_id != null){

      if (products_id.indexOf(product_id)>=0) {

//        print(products_id);

        await change_number_product(product_id);

      }else{

//        print("else");

        String data =products_id+ product_id + "_";
        prefs.setString('products_id', data);
        await add_product_data(product_id,title,price,img_url);

      }

    }else{
      String data = product_id + "_";
      prefs.setString('products_id', data);
      await add_product_data(product_id,title,price,img_url);


  }
    return true;

}

static add_product_data(String product_id, String title, int price,String img_url) async{

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('title_'+product_id, title);
  prefs.setInt('price_'+product_id, price);
  prefs.setString('img_url_'+product_id, img_url);
  prefs.setInt('number_'+product_id, 1);
  prefs.setInt('mood_'+product_id, 0);

  }

  static Future<bool> change_number_product(String product_id)async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    int n = prefs.getInt('number_'+product_id);
    n=n+1;
    prefs.setInt('number_'+product_id, n);
    return true;

  }

  static Future<int> change_number_product_less(String product_id)async{
    SharedPreferences prefs= await SharedPreferences.getInstance();



      int n = prefs.getInt('number_'+product_id);
      n=n-1;
      prefs.setInt('number_'+product_id, n);


      if(prefs.getInt('number_'+product_id)==0){

        return 0;

      }
    if(prefs.getInt('number_'+product_id)<0){
      n=n+1;
      prefs.setInt('number_'+product_id, n);

      return -1;

    }

    return 1;

  }

  static Future<bool> remove_cart_product(String product_id) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String products_id=prefs.getString("products_id");
    products_id=products_id.replaceAll(product_id+"_",  "");
    if(products_id.isEmpty){

      prefs.remove('products_id');

    }else{

      prefs.setString("products_id", products_id);

    }
    prefs.remove('title_'+product_id);
    prefs.remove('price_'+product_id);
    prefs.remove('img_url_'+product_id);
    prefs.remove('number_'+product_id);
    prefs.remove('mood_'+product_id);


  }
  static Future<bool> empry_cart() async{
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    String products_id=prefs.getString("products_id");
    
    List<String> p_id=products_id.split('_');
    for(int i=0;i<(p_id.length-1);i++){
      
      prefs.remove('title_'+p_id[i]);
      prefs.remove('price_'+p_id[i]);
      prefs.remove('img_url_'+p_id[i]);
      prefs.remove('number_'+p_id[i]);
      prefs.remove('mood_'+p_id[i]);
      
    }
    prefs.remove("products_id");
    return true;

  }



  static Future<String> get_card_product()async{

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String products_id=prefs.getString('products_id');

    return products_id;

  }



  static Future<Map<String,dynamic>> get_product_data(String product_id) async{


    Map<String,dynamic> data=Map();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String title = prefs.getString('title_'+product_id);
    int price = prefs.getInt('price_'+product_id);
    String img_url = prefs.getString('img_url_'+product_id);
    int number = prefs.getInt('number_'+product_id);
    int mood = prefs.getInt('mood_'+product_id);

    data['title']=title;
    data['price']=price;
    data['img_url']=img_url;
    data['number']=number;
    data['mood']=mood;


    return data;

  }


}

