import 'dart:convert';
import 'package:flutter/foundation.dart';
class Product with ChangeNotifier{
  final String id;
  final String title;
  final double weight;
  final double price;
  final String imageUrl;
  bool isFavorite;
  bool iscart;


  Product({
    required this.id,
    required this.title,
    required this.weight,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
    this.iscart = false,
  });

 /*Future<void> toggleFavoriteStatus(String token,String userId)async{
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = Uri.parse('https://shop-624d0-default-rtdb.firebaseio.com/userFavorites/$userId/$id.json?auth=$token');
    try {
      final response = await http.put(url,
          body:json.encode(
            isFavorite,
          ) );
      if(response.statusCode>=400){
        isFavorite = oldStatus;
        notifyListeners();
      }
    }catch(error){
      isFavorite = oldStatus;
      notifyListeners();
    }
  }*/
  void toggleCartStatus() {
    iscart = !iscart;
    notifyListeners();

  }
}
