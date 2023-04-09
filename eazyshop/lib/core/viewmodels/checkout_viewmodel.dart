import 'package:eazyshop/core/viewmodels/cart_viewmodel.dart';
import 'package:flutter/material.dart';

class Checkout extends ChangeNotifier {
  CartViewmodel cart;

  Checkout({required this.cart});

  void processPayment() {
    //payment logic here...
    print('Payment processed for total of \$${cart.total}');
    cart.clear();
  }

  void cancel() {
    print('Checkout cancelled, items still in cart');
  }
}
