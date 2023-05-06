import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/rocket_details_response.dart';

class RocketDetailsApiService {

  static const apiEndPoint = 'https://api.spacexdata.com/v4/rockets/';

  String error = '';

  Future<RocketDetailsResponse?> getDataFromApi2(String id) async {

    try {
      Response response = await http.get(Uri.parse(apiEndPoint+id));
      if(response.statusCode == 200) {

        return RocketDetailsResponse.fromJson(jsonDecode(response.body));
       
        log('Json 2 ---> $json');
      }
    } catch(e) {
      error = e.toString();
      return null;
    }
    return null;
  }
}