import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart_item.dart';

class CartViewmodel extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get itemCount => _items.length;

  double get subtotal => _items.fold(0, (sum, item) => sum + item.total);

  double get tax => subtotal * 0.1;

  double get total => subtotal + tax;

  Future<void> addItem(CartItem item) async {
    var index = _items.indexWhere((i) => i.name == item.name);

    if (index >= 0) {
      _items[index].quantity += item.quantity;
    } else {
      _items.add(item);
    }
    await saveCart();
    notifyListeners();
  }

  Future<void> removeItem(CartItem item) async {
    _items.removeWhere((i) => i.name == item.name);
    notifyListeners();
    await saveCart();
  }

  Future<void> clear() async {
    _items.clear();
    notifyListeners();
    await saveCart();
  }

  bool isItemInCart(CartItem item) {
    return _items.any((i) => i.name == item.name);
  }

  Future<void> increaseQuantity(CartItem item) async {
    var index = _items.indexWhere((i) => i.name == item.name);

    if (index >= 0) {
      _items[index].quantity++;
      notifyListeners();
      await saveCart();
    }
  }

  Future<void> decreaseQuantity(CartItem item) async {
    var index = _items.indexWhere((i) => i.name == item.name);

    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
      await saveCart();
    }
  }

  int getQuantity(CartItem item) {
    var index = _items.indexWhere((i) => i.name == item.name);

    if (index >= 0) {
      return _items[index].quantity;
    }

    return 0;
  }

  Future<void> loadCart() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartData = prefs.getString('cart');
      if (cartData != null && cartData.isNotEmpty) {
        final List<dynamic> jsonList = jsonDecode(cartData);
        print(cartData);
        _items = jsonList.map((json) => CartItem.fromJson(json)).toList();
        print(_items);
      } else {
        _items = [];
      }
    } catch (e) {
      print('Error loading cart: $e');
    }
  }

  Future<void> saveCart() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartData = jsonEncode(_items.map((item) => item.toJson()).toList());
      _items = _items
          .map((item) => item)
          .toList(); // Update _items with modified list
      await prefs.setString('cart', cartData);
    } catch (e) {
      print('Error saving cart: $e');
    }
  }
}
