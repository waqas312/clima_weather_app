import 'package:geolocator/geolocator.dart';

class Location {

  double? latitude;
  double? longitude;

Future <void> getCurrentLocation() async{
  try {

    bool serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      print('Location service is disable');
      return;
      
    }
LocationPermission permission = await Geolocator.checkPermission();
if (permission == LocationPermission.denied) {
  permission = await Geolocator.requestPermission();
  if (permission == LocationPermission.denied) {
    print('Permission denied');
    return;

    
  }
  
}
if (permission == LocationPermission.deniedForever) {
  print('Location denied forever');
  return;
  
}
    
    LocationSettings locationSettings =LocationSettings(accuracy: LocationAccuracy.low);
    Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
    latitude = position.latitude;
    longitude = position.longitude;
  } catch (e) {
    print(e);
    
  }
}

}
