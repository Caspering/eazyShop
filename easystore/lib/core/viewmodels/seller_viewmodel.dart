import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import '../models/seller_model.dart';
import '../models/user_model.dart';
import '../services/api.dart';
import '../services/firebase_storage.dart';

class SellerViewmodel extends ChangeNotifier {
  String? _firstName;
  String? _lastName;
  String? _bio;
  String? _phoneNumber;
  String? _whatsappLink;
  String? _twitterLink;
  String? _instagramLink;
  String? _imageUrl;
  String? _username;
  File? _image;
  String? get firstname => _firstName;
  String? get username => _username;
  String? get lastname => _lastName;
  String? get bio => _bio;
  String? get phoneNumber => _phoneNumber;
  String? get whatsappLink => _whatsappLink;
  String? get twitterLink => _twitterLink;
  String? get instagramLink => _instagramLink;
  String? get imageUrl => _imageUrl;
  File? get image => _image;
  Seller? _currentSeller; // Updated class name
  Seller? get currentSeller => _currentSeller;
  final Api _api = Api("sellers");
  setUsername(name) {
    _username = name;
  }

  Future<void> setImageUrl(image, uid) async {
    _imageUrl = await Storage().uploadImage(image, uid, "Sellers");
  }

  setSeller(Seller cceo) {
    // Updated class name
    _currentSeller = cceo;
  }

  Future<Seller> getCeoById(id) async {
    // Updated class name
    var doc = await _api.getDocumentById(id);
    return Seller.fromMap(
        doc.data() as Map<String, dynamic>, id); // Updated class name
  }

  List<Seller> shops = [];
  Future<List<Seller>> getShops() async {
    var result = await _api.getDocuments();
    shops = result.docs
        .map(
            (doc) => Seller.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
    return shops;
  }

  updateName(first, second, uid, username) {
    _api.updateDocumentMap(
        {"firstname": first, "lastname": second, "username": username}, uid);
  }

  updateImage(imageUrl, uid) {
    _api.updateDocumentMap({"imageUrl": imageUrl}, uid);
  }

  updateSocials(insta, whatsapp, twitter, phoneNumber, uid) {
    _api.updateDocumentMap({
      'instagramLink': insta,
      'phoneNumber': phoneNumber,
      'whatsappLink': whatsapp,
      'twitterLink': twitter
    }, uid);
  }

  Stream<DocumentSnapshot> streamCeoById(id) {
    return _api.streamDocumentById(id);
  }

  Future<bool> checkIfUser(userId) async {
    var result = await _api.getDocumentById(userId);
    if (result.exists) {
      return true;
    } else {
      return false;
    }
  }

  Future addUser(Users data, uid) async {
    // Updated class name
    var result = await _api.setData(data.toJson(), uid);
    return result;
  }

  setImage(photo) {
    _image = photo;
    notifyListeners();
  }

  void setFirstname(text) {
    _firstName = text;
  }

  void setLastname(text) {
    _lastName = text;
  }

  void setPhoneNumber(text) {
    _phoneNumber = text;
  }

  void setWhatsappLink(text) {
    _whatsappLink = text;
  }

  void setInstagramLink(text) {
    _instagramLink = text;
  }

  void setTwitterLink(text) {
    _twitterLink = text;
  }
}
