import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class BaseViewModel with ChangeNotifier {
  bool _isLoading = false;
  int _currentIndex = 0;

  bool get isLoading => _isLoading;
  int get currentIndex => _currentIndex;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void toggleLoading() {
    isLoading = !isLoading;
  }
}
