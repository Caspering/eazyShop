class OrderItem {
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;
  String shopName;

  OrderItem(
      {required this.name,
      required this.price,
      required this.quantity,
      required this.imageUrl,
      required this.shopName});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity,
      'imageUrl': imageUrl,
      'shopName': shopName
    };
  }
}
