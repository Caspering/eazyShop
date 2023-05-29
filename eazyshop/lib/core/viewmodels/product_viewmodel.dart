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
  List<Product> flashes = [];
  List<Product> categoryProducts = [];
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

  Future<List<Product>> getRecommendedItems() async {
    var result = await _api.getWhereIsEqualTo(false, "isFlash");
    products = result.docs
        .map((doc) =>
            Product.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
    products.shuffle();
    return products.take(6).toList();
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

  Future<List<Product>> getCategoryProd(category) async {
    var result =
        await _api.queryWhereEqualTox2(false, "isFlash", category, "category");
    categoryProducts = result.docs
        .map((doc) =>
            Product.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();

    return categoryProducts;
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
