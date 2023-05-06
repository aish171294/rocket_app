import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/rocket_list_response.dart';
import 'package:flutter_assignment/services/rocket_list_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../models/rocket_details_response.dart';
import '../../services/rocket_details_api_service.dart';

class DetailsPageProvider extends ChangeNotifier {
  String? id;

  final _service = RocketDetailsApiService();

  bool isLoading = false;

  RocketDetailsResponse? _rocketDetails;
  RocketDetailsResponse? get rocketDetails => _rocketDetails;

  Future<void> getAllDataFromRocketDetails() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getDataFromApi2(id!);

    _rocketDetails = response;

    isLoading = false;
    notifyListeners();
  }
}