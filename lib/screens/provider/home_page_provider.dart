import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/rocket_list_response.dart';
import 'package:flutter_assignment/services/rocket_list_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HomePageProvider extends ChangeNotifier {

  final _service = RocketListApiService();

  bool isLoading = false;

  List<RocketListResponse> _rocketLists = [];
  List<RocketListResponse> get rocketLists => _rocketLists;

  Future<void> getAllDataFromRocketList() async {
    isLoading = true;
    notifyListeners();

   final response = await _service.getDataFromApi1();

   _rocketLists.clear();
   _rocketLists.addAll(response);
   isLoading = false;
   notifyListeners();
  }
}