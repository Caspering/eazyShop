class Users {
  String? id;
  String? firstname;
  String? lastname;
  int? ceoScore;
  String? phoneNumber;
  String? instagramLink;
  String? whatsappLink;
  String? twitterLink;
  String? bio;
  String? imageUrl;
  String? username;
  List? subscribers;

  Users({
    this.id,
    this.bio,
    this.ceoScore,
    this.firstname,
    this.instagramLink,
    this.lastname,
    this.phoneNumber,
    this.twitterLink,
    this.imageUrl,
    this.subscribers,
    this.whatsappLink,
    this.username,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      bio: json['bio'],
      ceoScore: json['ceoScore'],
      subscribers: json['subscribers'],
      username: json['username'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      imageUrl: json['imageUrl'],
      instagramLink: json['instagramLink'],
      phoneNumber: json['phoneNumber'],
      whatsappLink: json['whatsappLink'],
      twitterLink: json['twitterLink'],
    );
  }

  toJson() {
    return {
      "bio": bio,
      'ceoScore': ceoScore,
      "firstname": firstname,
      'lastname': lastname,
      'instagramLink': instagramLink,
      'phoneNumber': phoneNumber,
      'whatsappLink': whatsappLink,
      'imageUrl': imageUrl,
      'twitterLink': twitterLink,
      'username': username,
      "subscribers": subscribers,
    };
  }
}
