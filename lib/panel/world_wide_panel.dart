import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {
  final Map worldwide;

  const WorldWidePanel({Key key, this.worldwide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 4,
        ),
        children: [
          StatusPanel(
            title: 'CONFIRNED',
            panelColor: Colors.red[100],
            textColor: Colors.red,
            count: worldwide['cases'].toString(),
          ),
          StatusPanel(
            title: 'ACTIVE',
            panelColor: Colors.blue[100],
            textColor: Colors.blue,
            count: worldwide['active'].toString(),
          ),
          StatusPanel(
            title: 'RECOVERD',
            panelColor: Colors.green[100],
            textColor: Colors.green,
            count: worldwide['recovered'].toString(),
          ),
          StatusPanel(
            title: 'DEATHS',
            panelColor: Colors.grey[400],
            textColor: Colors.black,
            count: worldwide['deaths'].toString(),
          ),
          StatusPanel(
            title: 'TODAY CASES',
            panelColor: Colors.red[100],
            textColor: Colors.red,
            count: worldwide['todayCases'].toString(),
          ),
          StatusPanel(
            title: 'TODAY RECOVERD',
            panelColor: Colors.green[100],
            textColor: Colors.green,
            count: worldwide['todayRecovered'].toString(),
          ),
          StatusPanel(
            title: 'TODAY DEATHS',
            panelColor: Colors.grey[400],
            textColor: Colors.black,
            count: worldwide['todayDeaths'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(spreadRadius: 2, color: Colors.black)],
            color: panelColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: EdgeInsets.all(5),
        height: 80,
        width: MediaQuery.of(context).size.width / 2.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: textColor),
            ),
            Text(
              count,
              style: TextStyle(
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
