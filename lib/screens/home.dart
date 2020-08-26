import 'dart:convert';

import 'package:covid19/data_source.dart';
import 'package:covid19/panel/info_panel.dart';
import 'package:covid19/screens/country_page.dart';
import 'package:covid19/screens/most_countries.dart';
import 'package:covid19/panel/world_wide_panel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchWorldWideData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        centerTitle: true,
        title: Text("Covid-19 panel"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 100,
              width: MediaQuery.of(context).size.width,
              color: Colors.amber[200],
              child: Center(
                child: Text(
                  DataSource.quote,
                  style: TextStyle(
                      //      color: Colors.amber[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width / 2.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.blue[800],
                              Colors.blue[800],
                              Colors.blue[800],
                            ])),
                    child: FlatButton(
                      child: Text(
                        " Regional",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CountryPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width / 2.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.blue[800],
                              Colors.blue[800],
                              Colors.blue[800],
                            ])),
                    child: FlatButton(
                      child: Text(
                        " Most Contries",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MostContries(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              endIndent: 15,
              height: 20,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "WorldWide",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            worldData == null
                ? Center(child: CircularProgressIndicator())
                : WorldWidePanel(
                    worldwide: worldData,
                  ),
            InfoPanel(
              onTap: () {
                launch(
                    "https://www.who.int/indonesia/news/novel-coronavirus/mythbusters");
              },
              icon: Icons.arrow_forward,
              text: "MYTH BUSTERS",
            ),
            InfoPanel(
              onTap: () {
                launch("https://covid19responsefund.org/en/");
              },
              icon: Icons.arrow_forward,
              text: "DANATE",
            ),
            SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
