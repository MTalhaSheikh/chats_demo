import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PaiChart(),
    );
  }
}

class PaiChart extends StatefulWidget {
  @override
  _PaiChartState createState() => _PaiChartState();
}

class _PaiChartState extends State<PaiChart> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Flutter": 5,
      "React": 3,
      "Xamarin": 2,
      "Ionic": 2,
    };

    Widget _getBody(int index) {
      switch (index) {
        case 0:
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.orange[200],
            child: Center(
              child: PieChart(
                animationDuration: Duration(milliseconds: 1200),
                dataMap: dataMap,
                chartType: ChartType.ring,
                // legendPosition: LegendPosition.bottom,
                // showChartValuesOutside: true,
                chartRadius:  MediaQuery.of(context).size.width*0.50,
              ),
            ),
          ); // Create this function, it should return your first page as a widget
        case 1:
          return Container(
            color: Colors.orange[200],
            child: Center(
              child: PieChart(
                dataMap: dataMap,
                animationDuration: Duration(milliseconds: 1200),
                chartType: ChartType.disc,
              ),
            ),
          ); // Create this function, it should return your second page as a widget
      }
      return Container(
          color: Colors.orange[200],
          child: Center(
            child: Text("There is no page builder for this index."),
          ));
    }

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        // color: Colors.orange,
        backgroundColor: Colors.orange[200],
        key: _bottomNavigationKey,
        items: <Widget>[
          Icon(Icons.camera, size: 30),
          Icon(Icons.stop_circle_rounded, size: 30),
          Icon(Icons.add_chart, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      appBar: AppBar(
        title: Text(
          "Pai Chart",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: _getBody(_page),
    );
  }
}

