import 'dart:io';

import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../services/api.dart';
import '../services/firebase_storage.dart';

class ProductViewmodel extends ChangeNotifier {
  String? _category;
  String? _imageUrl;
  File? _image;
  Product? _product;
  String? get category => _category;
  Product? get product => _product;
  String? get imageUrl => _imageUrl;
  File? get image => _image;
  final Api _api = Api("products");
  List<Product> products = [];
  List<Product> fitness = [];
  List<Product> flashes = [];
  List<Product> gifts = [];
  List<Product> categoryProducts = [];
  List<Product> subscriptions = [];
  List<Product> ceoProducts = [];
  List<Product> ceoFlash = [];
  BuildContext? _context;
  List<Product>? _currentList;
  List<Product>? get currentList => _currentList;
  BuildContext? get context => _context;
  setCurrentList(clist) {
    _currentList = clist;
  }

  void setCategory(scategory) {
    _category = scategory;
    notifyListeners();
  }

  setCurrentContext(ctx) {
    _context = ctx;
  }

  void setCurrentProduct(currentProduct) {
    _product = currentProduct;
  }

  Future<List<Product>> getSubscribedItems(userId) async {
    var result = await _api.queryWhereArrayContainsAndIsEqualTo(
        false, "isFlash", userId, "subscribers");
    subscriptions = result.docs
        .map((doc) =>
            Product.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();

    return subscriptions;
  }

  Future<List<Product>> getRecommendedItems() async {
    var result = await _api.getWhereIsEqualTo(false, "isFlash");
    products = result.docs
        .map((doc) =>
            Product.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
    products.shuffle();
    return products.take(6).toList();
  }

  Future<List<Product>> getCeoProducts(uid) async {
    var result =
        await _api.queryWhereEqualTox2(false, "isFlash", uid, "sellerId");
    ceoProducts = result.docs
        .map((doc) =>
            Product.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();

    return ceoProducts;
  }

  Future<List<Product>> getCeoFlash(uid) async {
    var result = await _api.getRecentDocsCeo(uid);
    ceoFlash = result.docs
        .map((doc) =>
            Product.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();

    return ceoFlash;
  }

  setAsFlash(productId, newPrice) {
    _api.updateDocument("isFlash", true, productId);
    _api.updateDocument("dateAdded", DateTime.now(), productId);
    _api.updateDocument("discountPrice", newPrice, productId);
  }

  deleteProduct(productId, List<Product> array, cproduct) {
    _api.deleteDocument(productId);
    array.remove(cproduct);
    notifyListeners();
  }

  Future<List<Product>> getGiftItems() async {
    var result =
        await _api.queryWhereEqualTox2(false, "isFlash", "Gifts", "category");
    gifts = result.docs
        .map((doc) =>
            Product.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
    gifts.shuffle();
    return gifts.take(12).toList();
  }

  Future<List<Product>> getCategoryProd(category) async {
    var result =
        await _api.queryWhereEqualTox2(false, "isFlash", category, "category");
    categoryProducts = result.docs
        .map((doc) =>
            Product.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();

    return categoryProducts;
  }

  Future<List<Product>> getFitnessItems() async {
    var result = await _api.queryWhereEqualTox2(
        false, "isFlash", "Gym equipment", "category");
    fitness = result.docs
        .map((doc) =>
            Product.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
    fitness.shuffle();
    return fitness.take(12).toList();
  }

  Future<List<Product>> getFlashSales() async {
    var result = await _api.getRecentDocs();
    flashes = result.docs
        .map((doc) =>
            Product.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();

    return flashes;
  }

  setImage(photo) {
    _image = photo;
    notifyListeners();
  }

  Future<void> setImageUrl(image, fileName) async {
    _imageUrl = await Storage().uploadImage(image, fileName, "products");
  }

  Future addProduct(Product data) async {
    var result = await _api.addData(data.toJson());
    return result;
  }
}
