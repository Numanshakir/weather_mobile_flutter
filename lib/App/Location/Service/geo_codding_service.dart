import 'package:geocoding/geocoding.dart';
import 'package:weather_mobile_flutter/App/Location/Model/location_model.dart';

mixin GeoCodingService {
  Future<LocationModel> getLocationDetails(double lat, double lang) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lang);
    Placemark place = placemarks[0];

    return LocationModel(
        zipCode: place.postalCode!,
        csName: place.isoCountryCode!,
        city: place.locality!,
        country: place.country!,
        name: place.name!,
        street: place.street!,
        subAdministrativeArea: place.subAdministrativeArea!);
  }
}
