class LocationModel {
  String name;
  String street;
  String city;
  String country;
  String subAdministrativeArea;
  String zipCode;
  String csName;
  LocationModel(
      {required this.city,
      required this.country,
      required this.name,
      required this.street,
      required this.csName,
      required this.zipCode,
      required this.subAdministrativeArea});
  factory LocationModel.empty() {
    return LocationModel(
        city: "",
        country: "",
        name: "",
        street: "",
        csName: "",
        zipCode: "",
        subAdministrativeArea: "",
    );
  }
}
