import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:wae/constants.dart';
//da3339799c0d4252d83f610a03e98881

class Weather {
  Weather();

  Future getWeatherLocation(String lat, String lon) async {
    try {
      var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apikey&units=metric');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future getWeatherCity(String cityName) async {
    try {
      var url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey&units=metric");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

}