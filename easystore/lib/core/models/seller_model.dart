class Seller {
  String? id;
  String? name;
  String? logoUrl;
  int totalRating;
  int totalRaters;
  String? firstname;
  String? lastname;
  String? phoneNumber;
  String? instagramLink;
  String? whatsappLink;
  String? twitterLink;
  String? bio;
  List? subscribers;
  Seller({
    this.id,
    this.logoUrl,
    this.name,
    required this.totalRaters,
    required this.totalRating,
    this.bio,
    this.firstname,
    this.instagramLink,
    this.lastname,
    this.phoneNumber,
    this.twitterLink,
    this.subscribers,
    this.whatsappLink,
  });

  double get rating => totalRating / totalRaters;

  Seller.fromMap(Map snapshot, this.id)
      : name = snapshot['name'],
        logoUrl = snapshot['logoUrl'],
        totalRating = snapshot['totalRating'] ?? 0,
        totalRaters = snapshot['totalRaters'] ?? 0;
  toJson() {
    return {
      "name": name,
      "logoUrl": logoUrl,
      "totalRating": totalRating,
      "totalRaters": totalRaters
    };
  }
}
