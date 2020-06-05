import 'package:location/location.dart';
import 'package:rebound_mtb/model/UserLocation.dart';


class LocationService {
  //UserLocation _currentLocation;

  //var location = Location();

  static Future<UserLocation> getLocation() async {
    UserLocation _currentLocation;
    var location = Location();

    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
    } on Exception catch (e) {
      print('Could not get location: ${e.toString()}');
    }

    return _currentLocation;
  }
}

