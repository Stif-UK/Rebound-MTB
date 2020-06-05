class UserLocation {
  final double latitude;
  final double longitude;

  UserLocation({this.latitude, this.longitude});

  String toString(){
    return "latitude: "+latitude.toString()+", Longitude: "+longitude.toString();
  }
}