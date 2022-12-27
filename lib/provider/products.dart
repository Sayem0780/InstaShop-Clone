import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'package:shop/models/http_Exception.dart';

import './product.dart';

class Products with ChangeNotifier {
  //final dynamic authToken;
  late final dynamic userId;
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      weight: 1.5,
      price: 29.99,
      imageUrl:
      'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      weight: 1.2,
      price: 59.99,
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      weight: 3.5,
      price: 19.99,
      imageUrl:
      'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      weight: 5,
      price: 49.99,
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Red Shirt',
      weight: 2,
      price: 29.99,
      imageUrl:
      'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p6',
      title: 'Trousers',
      weight: 4,
      price: 59.99,
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p7',
      title: 'Yellow Scarf',
      weight: 3,
      price: 19.99,
      imageUrl:
      'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p8',
      title: 'A Pan',
      weight: 5,
      price: 49.99,
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
    Product(
      id: 'p9',
      title: 'Red Shirt',
      weight: 2,
      price: 29.99,
      imageUrl:
      'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p10',
      title: 'Trousers',
      weight: 4,
      price: 59.99,
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p11',
      title: 'Yellow Scarf',
      weight: 3,
      price: 19.99,
      imageUrl:
      'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p12',
      title: 'A Pan',
      weight: 5,
      price: 49.99,
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];
  // var _showFavoritesOnly = false;
  //Products(this.authToken,this.userId,this._items);

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  /*Future<void>fetchAndSetProducts([bool filterByUser = false]) async{
    final filterString =
    filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';
    var url = Uri.parse('https://shop-624d0-default-rtdb.firebaseio.com/product.json?auth=$authToken&$filterString');
    try{
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String,dynamic>;
      if(extractedData == null){
        return ;
      }
      url =Uri.parse('https://shop-624d0-default-rtdb.firebaseio.com/userFavorites/$userId.json?auth=$authToken');
      final favoriteResponse = await http.get(url);
      final favoriteData = json.decode(favoriteResponse.body);
      final List<Product> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(Product(
          id: prodId,
          title: prodData["title"],
          description: prodData["description"],
          price: prodData["price"],
          imageUrl: prodData["imageUrl"],
          isFavorite: favoriteData == null?false:favoriteData[prodId]??false,//If favoriteData is null then it means the user have not set any item as favorite there for we set the value false.If favoritedata is not null then user may set any of the item as favorite.So we need to find that item therefore we search that item with the prodId like this (favoriteData[prodId]). Here the the favoriteData is not null but incase the prodId may null.That case we also set the value false. Therefore we use ?? false.
        ));
      });
      _items = loadedProducts;
    }catch(e){
      throw{
        print(e)
      };
    }
    notifyListeners();
  }*/

  /*Future<void> addProduct(Product product) async{
    final url = Uri.parse('https://shop-624d0-default-rtdb.firebaseio.com/product.json?auth=$authToken');
   try{
     return await http
         .post(
       url,
       body: json.encode({
         'title': product.title,
         'description': product.description,
         'imageUrl': product.imageUrl,
         'price': product.price,
         'creatorId': userId,
       }),
     )
         .then((response) {
       final newProduct = Product(
         title: product.title,
         description: product.description,
         price: product.price,
         imageUrl: product.imageUrl,
         id: json.decode(response.body)['name'],
       );
       _items.add(newProduct);
       // _items.insert(0, newProduct); // at the start of the list
       notifyListeners();
     });
   } catch(error){
     rethrow;
   }
  }*/

  /*Future<void> updateProduct(String id, Product newProduct) async{
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url = Uri.parse('https://shop-624d0-default-rtdb.firebaseio.com/product/$id.json?auth=$authToken');
      await http.patch(url,body: json.encode(
        {
          'title': newProduct.title,
          'description': newProduct.description,
          'price': newProduct.price,
          'imageUrl': newProduct.imageUrl,
        }
      ));
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }*/

  /*Future<void>deleteProduct(String id) async{
    final url = Uri.parse('https://shop-624d0-default-rtdb.firebaseio.com/product/$id.json?auth=$authToken');
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    Product? existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(url);
    if(response.statusCode>= 400){
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Couldn\'t delete the product');
    }
    existingProduct = null;
  }*/
}
