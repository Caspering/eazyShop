class Seller {
  String? id;
  String? name;
  String? logoUrl;
  int totalRating;
  int totalRaters;
  Seller(
      {this.id,
      this.logoUrl,
      this.name,
      required this.totalRaters,
      required this.totalRating});

  double get rating => totalRating / totalRaters;

  Seller.fromMap(Map snapshot, this.id)
      : name = snapshot['name'],
        logoUrl = snapshot['logoUrl'],
        totalRating = snapshot['totalRating'],
        totalRaters = snapshot['totalRaters'];
  toJson() {
    return {
      "name": name,
      "logoUrl": logoUrl,
      "totalRating": totalRating,
      "totalRaters": totalRaters
    };
  }
}
