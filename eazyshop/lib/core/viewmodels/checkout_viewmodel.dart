import 'package:eazyshop/core/viewmodels/cart_viewmodel.dart';
import 'package:flutter/material.dart';

class Checkout extends ChangeNotifier {
  CartViewmodel cart;

  Checkout({required this.cart});

  void processPayment(vendorId) {
    //payment logic here...
    print(
        'Payment processed for total of \$${cart.getCartTotalForVendor(vendorId)}');
    cart.clearCartForVendor(vendorId);
  }

  void cancel() {
    print('Checkout cancelled, items still in cart');
  }
}
