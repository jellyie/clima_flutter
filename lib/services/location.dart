import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  List<Placemark> placemark;

  Location({this.latitude, this.longitude});

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}

// List traverse for 5 day 3 hr, 40 total, start at [1], add 8 until greater than 40
