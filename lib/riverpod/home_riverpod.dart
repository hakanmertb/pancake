import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pancake/models/palindrome_model.dart';
import 'package:pancake/service/api_service.dart';

final homeRiverpod = ChangeNotifierProvider((_) => HomeNotifier());

class HomeNotifier extends ChangeNotifier {
  final service = ApiService();

  Future<List<PalindromeModel>> request() async {
    var temp = strListString.replaceAll(RegExp(r'[\n]'), '');
    var response = _type
        ? await service.fakeApiRequest(temp)
        : await service.realApiRequest(temp);

    return response.map((item) => PalindromeModel.fromJson(item)).toList();
  }

  bool switcher = true;
  void requestSwitch() {
    switcher = false;
    notifyListeners();
  }

  final List<String> _strList = [];

  String strListString = "[]";

  void addStrList(String other) {
    _strList.add(other);
    _updateStrListString();
    notifyListeners();
  }

  void _updateStrListString() {
    strListString = "[";
    for (var str in _strList) {
      strListString = '$strListString\n"$str",';
    }
    if (_strList.isNotEmpty) {
      strListString = strListString.substring(0, strListString.length - 1);
      strListString = "$strListString\n"; // Son iki karakteri (',\n') kaldırır
    }
    strListString = '$strListString]';
  }

  void clearStrList() {
    _strList.clear();
    _updateStrListString();
    notifyListeners();
  }

  bool _type = true;
  bool type() {
    return _type;
  }

  void changeType(bool other) {
    _type = other;
    switcher = true;
    notifyListeners();
  }

  void resetSwitcher() {
    switcher = true;
    notifyListeners();
  }
}
