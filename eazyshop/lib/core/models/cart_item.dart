class CartItem {
  String name;
  double price;
  int quantity;
  String? imageUrl;
  String shopName;

  CartItem(
      {required this.name,
      required this.price,
      this.quantity = 1,
      this.imageUrl,
      required this.shopName});

  double get total => price * quantity;
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
        name: json['name'] ?? "",
        price: json['price'],
        quantity: json['quantity'],
        imageUrl: json['imageUrl'] ?? "",
        shopName: json['shotName'] ?? "");
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity,
      'imageUrl': imageUrl ?? "",
      'shopName': shopName,
    };
  }
}
