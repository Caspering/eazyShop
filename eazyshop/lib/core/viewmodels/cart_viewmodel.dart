import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart_item.dart';

class CartViewmodel extends ChangeNotifier {
  Map<String, List<CartItem>> _carts = {};

  Map<String, List<CartItem>> get carts => Map.unmodifiable(_carts);

  List<CartItem> getCartForVendor(String vendorId) {
    return _carts[vendorId] ?? [];
  }

  List<String> getVendorList() {
    return _carts.keys.toList();
  }

  String? _currentVendor;
  String? get currentVendor => _currentVendor;
  setCurrentVendor(id) {
    _currentVendor = id;
  }

  int get overallCartItemCount {
    return _carts.values.fold(0, (sum, cart) => sum + cart.length);
  }

  int getCartItemCountForVendor(String vendorId) {
    final cart = _carts[vendorId];
    return cart != null ? cart.length : 0;
  }

  double getCartSubtotalForVendor(String vendorId) {
    final cart = _carts[vendorId];
    return cart != null ? cart.fold(0, (sum, item) => sum + item.total) : 0.0;
  }

  double getCartTaxForVendor(String vendorId) {
    final subtotal = getCartSubtotalForVendor(vendorId);
    return subtotal.ceil() * 0.1;
  }

  double getCartTotalForVendor(String vendorId) {
    final subtotal = getCartSubtotalForVendor(vendorId);
    final tax = getCartTaxForVendor(vendorId);
    return subtotal + tax.ceil();
  }

  Future<void> addItemToCartForVendor(CartItem item, String vendorId) async {
    if (_carts.containsKey(vendorId)) {
      final cart = _carts[vendorId];
      final index = cart!.indexWhere((i) => i.name == item.name);
      if (index >= 0) {
        cart[index].quantity += item.quantity;
      } else {
        cart.add(item);
      }
    } else {
      _carts[vendorId] = [item];
    }
    await saveCarts();
    notifyListeners();
  }

  Future<void> removeItemFromCartForVendor(
      CartItem item, String vendorId) async {
    if (_carts.containsKey(vendorId)) {
      final cart = _carts[vendorId];
      cart!.removeWhere((i) => i.name == item.name);
      if (cart.isEmpty) {
        _carts.remove(vendorId);
      }
      notifyListeners();
      await saveCarts();
    }
  }

  Future<void> clearCartForVendor(String vendorId) async {
    if (_carts.containsKey(vendorId)) {
      _carts.remove(vendorId);
      notifyListeners();
      await saveCarts();
    }
  }

  bool isItemInCartForVendor(CartItem item, String vendorId) {
    final cart = _carts[vendorId];
    return cart != null && cart.any((i) => i.name == item.name);
  }

  Future<void> increaseQuantityForVendor(CartItem item, String vendorId) async {
    if (_carts.containsKey(vendorId)) {
      final cart = _carts[vendorId];
      final index = cart!.indexWhere((i) => i.name == item.name);
      if (index >= 0) {
        cart[index].quantity++;
        notifyListeners();
        await saveCarts();
      }
    }
  }

  Future<void> decreaseQuantityForVendor(CartItem item, String vendorId) async {
    if (_carts.containsKey(vendorId)) {
      final cart = _carts[vendorId];
      final index = cart!.indexWhere((i) => i.name == item.name);
      if (index >= 0) {
        if (cart[index].quantity > 1) {
          cart[index].quantity--;
        } else {
          cart.removeAt(index);
        }
        notifyListeners();
        await saveCarts();
      }
    }
  }

  int getQuantityForVendor(CartItem item, String vendorId) {
    final cart = _carts[vendorId];
    final index = cart?.indexWhere((i) => i.name == item.name);
    return index != null && index >= 0 ? cart![index].quantity : 0;
  }

  Future<void> loadCarts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartsData = prefs.getString('carts');
      if (cartsData != null && cartsData.isNotEmpty) {
        final Map<String, dynamic> jsonMap = jsonDecode(cartsData);
        _carts = jsonMap.map((key, value) => MapEntry(key,
            (value as List).map((json) => CartItem.fromJson(json)).toList()));
      } else {
        _carts = {};
      }
    } catch (e) {
      print('Error loading carts: $e');
    }
  }

  Future<void> saveCarts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartsData = jsonEncode(
        _carts.map((key, value) => MapEntry(
              key,
              value.map((item) => item.toJson()).toList(),
            )),
      );
      await prefs.setString('carts', cartsData);
    } catch (e) {
      print('Error saving carts: $e');
    }
  }
}
