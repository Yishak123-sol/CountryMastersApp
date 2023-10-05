import 'package:country_game/util/colors.dart';
import 'package:flutter/material.dart';

class CountryDetailPage extends StatefulWidget {
  final String countryName;
  final String region;
  final String flagUrl;
  final int population;
  final String capitalCity;
  final dynamic officailLanguage;
  final dynamic currencies;
  final int area;
  const CountryDetailPage(
      {super.key,
      required this.capitalCity,
      required this.countryName,
      required this.currencies,
      required this.flagUrl,
      required this.officailLanguage,
      required this.population,
      required this.region,
      required this.area});

  @override
  State<CountryDetailPage> createState() => _CountryDetailPageState();
}

class _CountryDetailPageState extends State<CountryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.blue,
              ),
            )),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: NetworkImage(widget.flagUrl),
                  height: 250,
                  width: 300,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Country Name: ',
                            style: TextStyle(fontSize: 25),
                          ),
                          Text(widget.countryName, style: textStyle),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'region: ',
                            style: TextStyle(fontSize: 25),
                          ),
                          Text(widget.region, style: textStyle),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Capital City: ',
                            style: TextStyle(fontSize: 25),
                          ),
                          Text(widget.capitalCity, style: textStyle),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Population: ',
                            style: TextStyle(fontSize: 25),
                          ),
                          Text('${widget.population}', style: textStyle),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Area: ',
                            style: TextStyle(fontSize: 25),
                          ),
                          Text('${widget.area}', style: textStyle),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Currencies: ',
                            style: TextStyle(fontSize: 25),
                          ),
                          Text(
                            'boom',
                            style: textStyle,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Languages: ',
                            style: TextStyle(fontSize: 25),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              '${widget.officailLanguage.values}',
                              style: textStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                              height: 40,
                              width: 100,
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Center(
                                            child: Text(
                                          'Add to',
                                          style: TextStyle(fontSize: 25),
                                        )),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 40,
                                              width: 150,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  // Add To Learning Queue functionality
                                                  Navigator.of(context)
                                                      .pop(); // Close the dialog
                                                },
                                                child: const Text(
                                                    'Learning Queue'),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            SizedBox(
                                              height: 40,
                                              width: 150,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  // Add To Game List functionality
                                                  Navigator.of(context)
                                                      .pop(); // Close the dialog
                                                },
                                                child: const Text('Game List'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: const Text('Add To'),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
