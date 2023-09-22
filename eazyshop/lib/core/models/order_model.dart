import 'order_item.dart';

class OrderModel {
  final String id;
  final double total;
  final List<OrderItem> items;
  final DateTime timestamp;
  final String userId;
  final String? deliveryLocation;
  final String? deliveryInstruction;
  final DateTime deliveryTime;
  final String? phoneNumber;

  OrderModel(
      {required this.id,
      required this.total,
      required this.items,
      required this.timestamp,
      required this.userId,
      required this.deliveryInstruction,
      required this.deliveryLocation,
      required this.deliveryTime,
      required this.phoneNumber});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'total': total,
      'items': items.map((item) => item.toMap()).toList(),
      'timestamp': timestamp.toUtc().toIso8601String(),
      'userId': userId,
      'deliveryLocation': deliveryLocation,
      'deliveryInstruction': deliveryInstruction,
      'deliveryTime': deliveryTime.toUtc().toIso8601String(),
      'phoneNumber': phoneNumber,
    };
  }
}
