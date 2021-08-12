import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReportCard extends StatefulWidget {
  ReportCard({Key key}) : super(key: key);

  @override
  _ReportCardState createState() => _ReportCardState();
}

class GradesData {
  final String gradeSymbol;
  final int numberOfStudents;

  GradesData(this.gradeSymbol, this.numberOfStudents);
}

class _ReportCardState extends State<ReportCard> {
  final data = [
    GradesData('Present', 290),
    GradesData('Holiday', 30),
    GradesData('Leaves', 15),
    GradesData('Absent', 10),
  ];

  _getSeriesData() {
    List<charts.Series<GradesData, String>> series = [
      charts.Series(
          id: "Grades",
          data: data,
          labelAccessorFn: (GradesData row, _) =>
              '${row.gradeSymbol}: ${row.numberOfStudents}',
          domainFn: (GradesData grades, _) => grades.gradeSymbol,
          measureFn: (GradesData grades, _) => grades.numberOfStudents)
    ];
    return series;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("My Performance"),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  // child: Icon(CustomIcons.option, size: 20,),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Present",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 120,
                ),
                Text(
                  "47%",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  // child: Icon(CustomIcons.option, size: 20,),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Holiday",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 120,
                ),
                Text(
                  "16%",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  // child: Icon(CustomIcons.option, size: 20,),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.brown),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Leaves",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 120,
                ),
                Text(
                  "22%",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  // child: Icon(CustomIcons.option, size: 20,),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.purple),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Absent",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 120,
                ),
                Text(
                  "18%",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(
              child: new charts.PieChart(
                _getSeriesData(),
                animate: true,
                defaultRenderer: new charts.ArcRendererConfig(
                    arcWidth: 60,
                    arcRendererDecorators: [new charts.ArcLabelDecorator()]),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  // child: Icon(CustomIcons.option, size: 20,),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.purple),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Solved",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 120,
                ),
                Text(
                  "82%",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 0.000000000001,
                ),
                Container(
                  width: 20,
                  height: 20,
                  // child: Icon(CustomIcons.option, size: 20,),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.brown),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Pending",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 100,
                ),
                Text(
                  "22%",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 20,
                  height: 20,
                  // child: Icon(CustomIcons.option, size: 20,),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.orange),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Closed",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 120,
                ),
                Text(
                  "18%",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
