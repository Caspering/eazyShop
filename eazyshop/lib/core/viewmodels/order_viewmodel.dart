import 'package:eazyshop/core/viewmodels/cart_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/order_item.dart';
import '../models/order_model.dart';

class OrderViewModel {
  final CartViewmodel cart;

  OrderViewModel({required this.cart});

  Future<void> sendOrderToFirestore(userId) async {
    try {
      final firestore = FirebaseFirestore.instance;

      final collectionReference = firestore.collection('orders');

      final newDocumentReference = collectionReference.doc();

      final order = OrderModel(
        id: newDocumentReference.id,
        userId: userId,
        total: cart.total,
        items: cart.items
            .map((item) => OrderItem(
                name: item.name,
                price: item.price,
                quantity: item.quantity,
                shopName: item.shopName,
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
