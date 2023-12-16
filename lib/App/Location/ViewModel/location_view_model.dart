import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:weather_mobile_flutter/App/Location/Model/location_model.dart';
import 'package:weather_mobile_flutter/App/Location/Service/geo_codding_service.dart';
import 'package:weather_mobile_flutter/Base/ViewModel/disposable_provider.dart';
import 'package:weather_mobile_flutter/Utils/toast_message.dart';

class LocationViewModel extends DisposableProvider with GeoCodingService {
  @override
  void disposeValues() {
    // TODO: implement dispose
    super.dispose();
  }

  LocationModel locationModel = LocationModel.empty();
  LatLng currentLocation = LatLng(0.0, 0.0);
  LocationPermission? permission;
  bool isLocationError = false;

  bool serviceEnabled = false;
  onFetchMyLocaiton() async {
    Position? locData = await requestLocation();
    if (locData == null) {
      isLocationError = true;
      notifyListeners();
      return;
    } else {
      isLocationError = false;
      currentLocation = LatLng(locData.latitude, locData.longitude);
      locationModel =
          await getLocationDetails(locData.latitude, locData.longitude);
      notifyListeners();
    }
  }

  Future<Position>? requestLocation() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ShowMessage.onFail("Location service disabled");
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ShowMessage.onFail("Permission denied");

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ShowMessage.onFail("Location permissions are permanently denied");
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    return await Geolocator.getCurrentPosition();
  }
}
