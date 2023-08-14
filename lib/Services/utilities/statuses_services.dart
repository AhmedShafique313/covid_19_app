import 'package:covid_19_app/Models/StatusApi.dart';
import 'package:covid_19_app/Services/utilities/APIs_URL.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:http/http.dart';

class StatusServices {
  Future<StatusApiScreen> getWorldStatusApi() async {
    final Response = await http.get(Uri.parse(UriApi.worldStatusApi));
    if (Response.statusCode == 200) {
      var data = jsonDecode(Response.body);
      return StatusApiScreen.fromJson(data);
    } else {
      throw ('Error');
    }
  }
}
