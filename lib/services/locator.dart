import 'dart:ffi';

import 'package:geolocator/geolocator.dart';

class Location {

  double? latitude;
  double? longitude;

  Future<void> getLocation() async {
    bool isEnabled;
    LocationPermission permission;

    isEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }


    Position position =  await Geolocator.getCurrentPosition();
    latitude = position.latitude;
    longitude = position.longitude;

  }
}
