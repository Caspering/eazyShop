import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

import '../services/firebase_storage.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
Future<String> getJson() {
  return rootBundle.loadString('assets/sample_sellers.json');
}

class ProductViewmodel extends ChangeNotifier {}
