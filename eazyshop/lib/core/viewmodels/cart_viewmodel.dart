import 'package:flutter/material.dart';

import '../models/cart_item.dart';

class CartViewmodel extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get itemCount => _items.length;

  double get subtotal => _items.fold(0, (sum, item) => sum + item.total);

  double get tax => subtotal * 0.1;

  double get total => subtotal + tax;

  void addItem(CartItem item) {
    var index = _items.indexWhere((i) => i.name == item.name);

    if (index >= 0) {
      _items[index].quantity += item.quantity;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.removeWhere((i) => i.name == item.name);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
