import 'package:flutter/material.dart';

class CookieInfo with ChangeNotifier {
  int _currentProduction = 1;
  int _cookieReserve = 1;

  int get currentProduction {
    return _currentProduction;
  }

  set currentProduction(int production) {
    _currentProduction = production;
    notifyListeners();
  }

  int get currentCookieReserve {
    return _cookieReserve;
  }

  set cookieReserve(int cookieReserve) {
    this._cookieReserve = cookieReserve;
    notifyListeners();
  }

  void IncrementCookieProduction(int incremention) {
    currentProduction = incremention;
    notifyListeners();
  }

  void sumCurrentCookies(int t) {
    _cookieReserve += t;
    notifyListeners();
  }
}
