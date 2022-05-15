// ignore_for_file: recursive_getters, unused_field

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NewsData with ChangeNotifier {
  Map<String, dynamic> _map = {};
  bool _error = false;
  String _errorMessage = '';

  Map<String, dynamic> get map => map;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<void> get fetchData async {
    final response = await http.get(Uri.parse(
        'https://dl.dropbox.com/s/tifvv3vx91wfnmg/stories.json?dl=0'));

    if (response.statusCode == 200) {
      try {
        _map = jsonDecode(response.body);
        _error = false;
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _map = {};
      }
      notifyListeners();
    } else {
      _error = true;
      _errorMessage = "Error: It could be your internet connection?!";
      _map = {};
    }
  }

  void initialValues() {
    _map = {};
    _error = false;
    _errorMessage = "";
    notifyListeners();
  }
}
