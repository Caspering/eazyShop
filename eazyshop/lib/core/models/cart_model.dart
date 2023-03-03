class Cart {
  final int? id;
  final String? productId;
  final int? basePrice;

  final String? productName;
  final String? imgUrl;
  final int? quantity;
  Cart(
      {this.basePrice,
      this.id,
      this.imgUrl,
      this.productId,
      this.productName,
      this.quantity});
  Cart.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        productId = data['productId'],
        basePrice = data['basePrice'],
        productName = data['productName'],
        imgUrl = data['imgUrl'],
        quantity = data['quantity'];

  toJson() {
    return {
      'id': id,
      'productId': productId,
      'basePrice': basePrice,
      'productName': productName,
      'imgUrl': imgUrl,
      'quantity': quantity
    };
  }
}
