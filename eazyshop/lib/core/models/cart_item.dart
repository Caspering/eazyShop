class CartItem {
  String name;
  double price;
  int quantity;
  String imageUrl;
  String shopName;

  CartItem(
      {required this.name,
      required this.price,
      this.quantity = 1,
      required this.imageUrl,
      required this.shopName});

  double get total => price * quantity;
}
