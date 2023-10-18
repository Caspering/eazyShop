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
  final int? instockQuantity;

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
      this.instockQuantity,
      this.category,
      this.sellerId});
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      dateAdded: json['dateAdded'],
      description: json['description'],
      discountPrice: json['discountPrice'],
      isDiscounted: json['isDiscounted'],
      price: json['price'],
      productImage: json['productImage'],
      productName: json['productName'],
      category: json['category'],
      barcode: json['barcode'],
      instockQuantity: json['instockQuantity'],
      sellerId: json['sellerId'],
    );
  }

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
      "instockQuantity": instockQuantity,
      "sellerId": sellerId
    };
  }
}
