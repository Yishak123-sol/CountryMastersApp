class CountryModel {
  final Map <String, dynamic> currencies;
  final Map <String, dynamic> languages;
  final String countryName;
  final String region;
  final int area;
  final String flagUrl;
  final int population;
  final String capitalCity;

  CountryModel({
    required this.currencies,
    required this.languages,
    required this.capitalCity,
    required this.countryName,
    required this.area,
    required this.flagUrl,
    required this.population,
    required this.region,
  });

  Map<String, dynamic> toMap() {
    return {
      'countryName': countryName,
      'region': region,
      'area': area,
      'flagUrl': flagUrl,
      'population': population,
      'capitalCity': capitalCity,
    };
  }
}
