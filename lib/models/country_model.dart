class CountryModel {
  final String countryName;
  final String region;
  final String flagUrl;
  final double population;
  final String capitalCity;
  final String officailLanguage;
  final String currencies;

 CountryModel(
      {required this.capitalCity,
      required this.countryName,
      required this.currencies,
      required this.flagUrl,
      required this.officailLanguage,
      required this.population,
      required this.region});
}
