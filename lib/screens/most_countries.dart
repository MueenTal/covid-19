import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MostContries extends StatefulWidget {
  @override
  _MostContriesState createState() => _MostContriesState();
}

class _MostContriesState extends State<MostContries> {
  List countriesData;
  fetchCountriesData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
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
        backgroundColor: Colors.blue[800],
        title: Text("Most effected Contries"),
        centerTitle: true,
      ),
      body: countriesData == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "The Most",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  height: 10,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 25 - 152,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(spreadRadius: 3, color: Colors.grey)
                              ],
                              color: Colors.blueGrey[200],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          height: 85,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  (index + 1).toString() + " -",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  countriesData[index]['countryInfo']['flag'],
                                  height: 70,
                                  width: 70,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                countriesData[index]['country'],
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                countriesData[index]['cases'].toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: 10,
                  ),
                ),
              ],
            ),
    );
  }
}
