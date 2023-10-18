import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
Future<String> getJson() {
  return rootBundle.loadString('assets/sample_sellers.json');
}

class ProductViewmodel extends ChangeNotifier {}
