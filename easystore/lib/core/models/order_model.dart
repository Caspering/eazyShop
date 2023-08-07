import 'order_item.dart';

class OrderModel {
  final String id;
  final double total;
  final List<OrderItem> items;
  final DateTime timestamp;
  final String userId;

  OrderModel(
      {required this.id,
      required this.total,
      required this.items,
      required this.timestamp,
      required this.userId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'total': total,
      'items': items.map((item) => item.toMap()).toList(),
      'timestamp': timestamp,
    };
  }
}
