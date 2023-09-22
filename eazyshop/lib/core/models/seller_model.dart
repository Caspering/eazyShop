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

  Seller.fromMap(Map snapshot, this.id)
      : name = snapshot['name'] ?? "",
        logoUrl = snapshot['logoUrl'] ?? "",
        totalRating = snapshot['totalRating'] ?? 0,
        productCategories = snapshot['productCategories'] ?? [],
        totalRaters = snapshot['totalRaters'] ?? 0;
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
