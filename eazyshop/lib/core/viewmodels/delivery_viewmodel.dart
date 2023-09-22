import 'package:flutter/material.dart';

class DeliveryViewmodel extends ChangeNotifier {
  String? _deliveryLocation;
  String? get deliveryLocation => _deliveryLocation;
  String? _deliveryInstruction;
  String? get deliveryInstruction => _deliveryInstruction;
  DateTime? _deliveryTime = DateTime.now();
  DateTime? get deliveryTime => _deliveryTime;
  String? _phoneNumber;
  String? get phoneNumber => _phoneNumber;

  setDeliveryLocation(loc) {
    _deliveryLocation = loc;
    notifyListeners();
  }

  setDeliveryInsturction(inst) {
    _deliveryInstruction = inst;
    notifyListeners();
  }

  setDeliveryTime(dTime) {
    _deliveryTime = dTime;
    notifyListeners();
  }

  setPhoneNumber(phone) {
    _phoneNumber = phone;
    notifyListeners();
  }
}
