class Product {
  final String? id;
  final String? sellerId;
  final String? description;
  dynamic dateAdded;
  final String? productName;
  final int? price;
  final bool? isFlash;
  final int? discountPrice;
  final bool? isDiscounted;
  final String? productImage;
  final String? category;

  Product(
      {this.dateAdded,
      this.description,
      this.discountPrice,
      this.id,
      this.isDiscounted,
      this.isFlash,
      this.price,
      this.productImage,
      this.productName,
      this.category,
      this.sellerId});
  Product.fromMap(Map snapshot, this.id)
      : dateAdded = snapshot['dateAdded'],
        description = snapshot['description'],
        discountPrice = snapshot['discountPrice'],
        isDiscounted = snapshot['isDiscounted'],
        isFlash = snapshot['isFlash'],
        price = snapshot['price'],
        productImage = snapshot['productImage'],
        productName = snapshot['productName'],
        category = snapshot['category'],
        sellerId = snapshot['sellerId'];
  toJson() {
    return {
      "dateAdded": dateAdded,
      "description": description,
      "discountPrice": discountPrice,
      "isDiscounted": isDiscounted,
      "isFlash": isFlash,
      "price": price,
      "productImage": productImage,
      "productName": productName,
      "category": category,
      "sellerId": sellerId
    };
  }
}
