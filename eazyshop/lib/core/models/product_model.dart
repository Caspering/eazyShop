class Product {
  final String? id;
  final String? sellerId;
  final String? description;
  dynamic dateAdded;
  final String? productName;
  final int? price;
  final int? discountPrice;
  final bool? isDiscounted;
  final String? productImage;
  final String? category;
  final String? barcode;

  Product(
      {this.dateAdded,
      this.description,
      this.discountPrice,
      this.id,
      this.isDiscounted,
      this.price,
      this.productImage,
      this.productName,
      this.barcode,
      this.category,
      this.sellerId});
  Product.fromMap(Map snapshot, this.id)
      : dateAdded = snapshot['dateAdded'],
        description = snapshot['description'],
        discountPrice = snapshot['discountPrice'],
        isDiscounted = snapshot['isDiscounted'],
        price = snapshot['price'],
        productImage = snapshot['productImage'],
        productName = snapshot['productName'],
        category = snapshot['category'],
        barcode = snapshot['barcode'],
        sellerId = snapshot['sellerId'];
  toJson() {
    return {
      "dateAdded": dateAdded,
      "description": description,
      "discountPrice": discountPrice,
      "isDiscounted": isDiscounted,
      "price": price,
      'barcode': barcode,
      "productImage": productImage,
      "productName": productName,
      "category": category,
      "sellerId": sellerId
    };
  }
}
