import 'package:covid_19_app/Models/StatusApi.dart';
import 'APIs_URL.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StatusServices {
  Future<StatusApiScreen> getWorldStatusApi() async {
    final Response = await http.get(Uri.parse(AppUrl.worldStatusApi));
    if (Response.statusCode == 200) {
      var data = jsonDecode(Response.body);
      return StatusApiScreen.fromJson(data);
    } else {
      throw ('Error');
    }
  }

  Future<List<dynamic>> getCountriesListAPI() async {
    var data;
    final Response = await http.get(Uri.parse(AppUrl.countriesList));
    if (Response.statusCode == 200) {
      data = jsonDecode(Response.body);
      return data;
    } else {
      throw ('Error');
    }
  }
}
