import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fampay/Models/model.dart';
import 'package:http/http.dart' as http;

class DataProvider extends ChangeNotifier {
  List<ApiResponse>? _data;
  bool _isLoading = false;
  String? _error;

  List<ApiResponse>? get data => _data;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Method to fetch data from API
  Future<void> fetchData() async {
    const String url =
        'https://polyjuice.kong.fampay.co/mock/famapp/feed/home_section/?slugs=famx-paypage';
    try {
      _isLoading = true;
      _error = null; // Clear previous errors
      notifyListeners();

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        if (jsonData.isNotEmpty) {
          _data = jsonData.map((e) => ApiResponse.fromJson(e)).toList();
          _error = null;
        } else {
          _data = [];
          _error = 'No data available.';
        }
      } else {
        _error = 'Failed to load data: ${response.statusCode}';
      }
    } catch (e) {
      _error = 'Failed to load data: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
