import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countriesData;
  fetchCountriesData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {
      countriesData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCountriesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue[800],
          title: Text("Countries Status"),
        ),
        body: countriesData == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: countriesData == null ? 0 : countriesData.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    height: 130,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 10),
                          blurRadius: 10)
                    ]),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.2,
                          margin:
                              EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                countriesData[index]['country'],
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  countriesData[index]['countryInfo']['flag'],
                                  height: 70,
                                  width: 70,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "CONFIRNED: " +
                                      countriesData[index]['cases'].toString(),
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "ACTIVE: " +
                                      countriesData[index]['active'].toString(),
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "RECOVERD: " +
                                      countriesData[index]['recovered']
                                          .toString(),
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text("DEATHS: " +
                                    countriesData[index]['deaths'].toString()),
                              ),
                              // Text("TODAY CASES: " +
                              //     countriesData[index]['todayCases']
                              //         .toString()),
                              // Text("TODAY RECOVERD: " +
                              //     countriesData[index]['todayRecovered']
                              //         .toString()),
                              // Text("TODAY DEATHS: " +
                              //     countriesData[index]['todayDeaths']
                              //         .toString()),
                            ],
                          ),
                        ))
                      ],
                    ),
                  );
                },
              ));
  }
}
