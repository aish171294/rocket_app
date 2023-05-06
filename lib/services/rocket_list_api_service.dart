import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/rocket_list_response.dart';

class RocketListApiService {

  static const apiEndPoint = 'https://api.spacexdata.com/v4/rockets';

  String error = '';

  Future<List<RocketListResponse>> getDataFromApi1() async {
    final rocketList = <RocketListResponse>[];

    try {
      Response response = await http.get(Uri.parse(apiEndPoint));
      if(response.statusCode == 200) {
        List<dynamic> list = jsonDecode(response.body);
        for (var element in list) {
          rocketList.add( RocketListResponse.fromJson(element));
        }
        final json = jsonDecode(response.body) as List;
        log('Json 1---> $json');
      }
    } catch(e) {
      error = e.toString();
      return rocketList;
    }
    return rocketList;
  }
}