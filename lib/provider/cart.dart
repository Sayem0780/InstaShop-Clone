import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  int quantity;
  final double price;
  final double weight;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.weight,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  double get totalAmount {
    double total = 0;
    _items.forEach((key, CartItem) {
      total += (CartItem.price * CartItem.quantity!);
    });
    return total;
  }


  int get totalItem {
    int total = 0;
    _items.forEach((key, CartItem) {
      total += CartItem.quantity!;
    });
    return total;
  }
  double get totalWeight{
    double total = 0.0;
    _items.forEach((key, CartItem) {
      total+=(CartItem.weight*CartItem.quantity);
    });
    return total;
  }

  countItem(String productId) {
    _items[productId]!.quantity;
    notifyListeners();
  }

  lessItem(String productId) {
    // change quantity...
    _items.update(
      productId,
      (existingCartItem) => CartItem(
        id: existingCartItem.id,
        title: existingCartItem.title,
        price: existingCartItem.price,
        quantity: existingCartItem.quantity>0?existingCartItem.quantity - 1:0,
        weight: existingCartItem.weight,
      ),
    );
    notifyListeners();
  }

  addItem(
    String productId,
    double price,
    String title,
      double weight,
  ) {
    if (_items.containsKey(productId)) {
      // change quantity...
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity! + 1,
          weight: existingCartItem.weight,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
          weight: weight,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String ProductID) {
    if (!_items.containsKey(ProductID)) {
      return;
    }
    if (_items[ProductID]!.quantity! > 1) {
      _items.update(
          ProductID,
          (existingItem) => CartItem(
              id: existingItem.id,
              title: existingItem.title,
              quantity: existingItem.quantity! - 1,
              price: existingItem.price,
              weight: existingItem.weight,
          ));
    } else {
      _items.remove(ProductID);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
