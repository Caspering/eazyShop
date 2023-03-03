import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../services/api.dart';
import '../services/firebase_storage.dart';

class UserViewmodel extends ChangeNotifier {
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
  Ceo? _currentCeo;
  Ceo? get currentCeo => _currentCeo;
  final Api _api = Api("users");
  setUsername(name) {
    _username = name;
  }

  Future<void> setImageUrl(image, uid) async {
    _imageUrl = await Storage().uploadImage(image, uid, "Users");
  }

  setCeo(Ceo cceo) {
    _currentCeo = cceo;
  }

  Future<Ceo> getCeoById(id) async {
    var doc = await _api.getDocumentById(id);
    return Ceo.fromMap(doc.data() as Map<String, dynamic>, id);
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

  Future addUser(Ceo data, uid) async {
    var result = await _api.setData(data.toJson(), uid);
    return result;
  }

  Future addCeoScore(userId) async {
    var result = await getCeoById(userId);
    int? ceoScore = result.ceoScore;
    _api.updateDocument("ceoScore", ceoScore! + 1, userId);
  }

  Future subscribe(userId, ceoId) async {
    var result = await getCeoById(ceoId);
    List subscribers = result.subscribers!;
    subscribers.add(userId);
    _api.updateDocument("subscribers", subscribers, ceoId);
  }

  Future unsubscribe(userId, ceoId) async {
    var result = await getCeoById(ceoId);
    List subscribers = result.subscribers!;
    subscribers.remove(userId);
    _api.updateDocument("subscribers", subscribers, ceoId);
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
