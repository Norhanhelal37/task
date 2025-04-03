import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacement(String routeName, String fName, {Object? arguments}) {
    return Navigator.of(this).pushReplacement(MaterialPageRoute(builder: (_) => Navigator.of(this).widget),);
  }

  void pop() => Navigator.pop(this);
}