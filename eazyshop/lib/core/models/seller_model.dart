class Seller {
  String? id;
  String? name;
  String? logoUrl;
  int totalRating;
  int totalRaters;
  List<String>? productCategories;
  Seller(
      {this.id,
      this.logoUrl,
      this.name,
      this.productCategories,
      required this.totalRaters,
      required this.totalRating});

  double get rating => totalRating / totalRaters;

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      id: json['id'],
      name: json['name'] ?? "",
      logoUrl: json['logoUrl'] ?? "",
      totalRating: json['totalRating'] ?? 0,
      productCategories: json['productCategories'] ?? [],
      totalRaters: json['totalRaters'] ?? 0,
    );
  }

  toJson() {
    return {
      "name": name,
      "logoUrl": logoUrl,
      "totalRating": totalRating,
      "totalRaters": totalRaters,
      "productCategories": productCategories
    };
  }
}
