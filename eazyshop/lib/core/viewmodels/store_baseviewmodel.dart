import 'package:eazyshop/ui/views/current_store_feed.dart';
import 'package:flutter/material.dart';

class StoreBaseViewmodel extends ChangeNotifier {
  Widget _currentScreen = CurrentStoreFeed();
  Widget get currentScreen => _currentScreen;
  setCurrentScreen(Widget screen) {
    _currentScreen = screen;
    notifyListeners();
  }
}
