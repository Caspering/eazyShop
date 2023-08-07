import 'package:flutter/material.dart';

import 'cart_viewmodel.dart';

class Checkout extends ChangeNotifier {
  CartViewmodel cart;

  Checkout({required this.cart});

  void processPayment(vendorId) {
    //payment logic here...
    print(
        'Payment processed for total of \$${cart.getCartTaxForVendor(vendorId)}');
    cart.clearCartForVendor(vendorId);
  }

  void cancel() {
    print('Checkout cancelled, items still in cart');
  }
}
