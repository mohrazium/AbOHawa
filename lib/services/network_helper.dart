import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as Http;

import 'locations.dart';

const String apiKey = '92918670333c24770700633516b0db08';

class NetworkHelper {
  Future<dynamic> getLocationData() async {
    Position location = await Locations().getCurrentLocation();
    String url = 'https://api.openweathermap.org/data/2.5/weather?'
        'lat=${location.latitude}&lon=${location.longitude}'
        '&appid=$apiKey&units=metric';
    print(url);
    Http.Response response = await Http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }
}
