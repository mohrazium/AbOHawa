import 'package:geolocator/geolocator.dart' as GPS;

class Locations {
  Future<GPS.Position> getCurrentLocation() async {
    GPS.Position currentPosition = await GPS.Geolocator()
        .getCurrentPosition(desiredAccuracy: GPS.LocationAccuracy.low);
    return currentPosition;
  }
}
