import 'package:eazyshop/core/viewmodels/cart_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/order_item.dart';
import '../models/order_model.dart';

class OrderViewModel {
  final CartViewmodel cart;
  final String vendorId;
  OrderViewModel({required this.cart, required this.vendorId});

  Future<void> sendOrderToFirestore(userId) async {
    try {
      final firestore = FirebaseFirestore.instance;

      final collectionReference = firestore.collection('orders');

      final newDocumentReference = collectionReference.doc();

      final order = OrderModel(
        id: newDocumentReference.id,
        userId: userId,
        total: cart.getCartTotalForVendor(vendorId),
        items: cart
            .getCartForVendor(vendorId)
            .map((item) => OrderItem(
                name: item.name,
                price: item.price,
                quantity: item.quantity,
                shopId: item.shopId,
                imageUrl: item.imageUrl ?? ""))
            .toList(),
        timestamp: DateTime.now(),
      );

      // Save the order data to Firestore
      await newDocumentReference.set(order.toMap());
    } catch (error) {
      print('Error sending order to Firestore: $error');
    }
  }
}
