class CakeShop {
  const CakeShop(
      {required this.name,
      required this.phone,
      required this.address,
      required this.description,
      required this.openCloseTime,
      required this.website,
      required this.facebook,
      required this.latitude,
      required this.longitude,
      required this.images});
  final String name,
      phone,
      address,
      description,
      openCloseTime,
      website,
      facebook;
  final double latitude, longitude;
  final List<String> images;
  Uri get phoneUri => Uri(scheme: 'tel', path: phone);
  Uri get websiteUri => Uri.parse(website);
  Uri get facebookUri => Uri.parse(facebook);
  Uri get mapUri => Uri.https(
        'www.openstreetmap.org',
        '/',
        {'mlat': '$latitude', 'mlon': '$longitude'},
      ).replace(fragment: 'map=17/$latitude/$longitude');
}
