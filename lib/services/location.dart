import 'package:geolocator/geolocator.dart';

class Location {
  dynamic latitude;
  dynamic longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  get getLatitude {
    return latitude;
  }

  get getLongitude {
    return longitude;
  }
}
