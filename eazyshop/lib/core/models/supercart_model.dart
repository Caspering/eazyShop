class SuperCart {
  final String? id;
  final String? userId;
  final String? sellerId;
  List<Map<String, dynamic>>? products;
  SuperCart({this.id, this.products, this.sellerId, this.userId});
  SuperCart.fromMap(Map snapshot, this.id)
      : sellerId = snapshot['sellerId'],
        userId = snapshot['userId'],
        products = snapshot['products'];
  toJson() {
    return {'sellerId': sellerId, 'userId': userId, 'products': products};
  }
}
