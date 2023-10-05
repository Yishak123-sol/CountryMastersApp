import 'package:country_game/pages/country_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryList extends StatefulWidget {
  const CountryList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  List<dynamic> countries = [];
  List<dynamic> displayedCountries = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.https('countryapi.io', '/api/all',
          {'apikey': 'RCOSAkTz2mJX2SM4SyGsy3Svay3SyADhxJMOpfiC'}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data is Map) {
        setState(() {
          countries = data.values.toList();
          displayedCountries = countries;
          displayedCountries.sort((a, b) {
            final nameA = a['name'] as String;
            final nameB = b['name'] as String;
            return nameA.compareTo(nameB);
          });
        });
      }
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  void updateSearch(String searchText) {
    setState(() {
      displayedCountries = countries.where((country) {
        final name = country['name'] as String;
        return name.toLowerCase().contains(searchText.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
            child: Text(
          'Country List',
          style: TextStyle(fontSize: 22),
        )),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (text) {
                updateSearch(text);
              },
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  hintText: 'Search for a country...',
                  prefixIcon: Icon(Icons.search),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayedCountries.length,
              itemBuilder: (BuildContext context, int index) {
                if (displayedCountries.isEmpty) {
                  return const Center(
                    child: Text('No results found.'),
                  );
                } else {
                  final country = displayedCountries[index];
                  final flagUrlMediumSized =
                      country['flag']['medium'] as String;
                  final flagUrlLagrgeSized =
                      country['flag']['medium'] as String;
                  final capitalCity = country['capital'] as String;
                  final currencies = country['currencies'];
                  final population = country['population'];
                  final officailLanguage = country['languages'];
                  final region = country['region'] as String;
                  final area = country['area'];

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return CountryDetailPage(
                            capitalCity: capitalCity,
                            countryName: country['name'] ?? 'Unknown',
                            currencies: currencies,
                            flagUrl: flagUrlLagrgeSized,
                            officailLanguage: officailLanguage,
                            population: population,
                            region: region,
                            area: area);
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Row(
                        children: [
                          Image(
                            image: NetworkImage(
                              flagUrlMediumSized,
                            ),
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  country['name'] ?? 'Unknown',
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Text(
                                  country['region'] ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black45),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
