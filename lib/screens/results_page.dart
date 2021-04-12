import 'package:carparkley/screens/carpark_info_screen.dart';
import 'package:carparkley/screens/error_screen.dart';
import 'package:carparkley/services/get_carpark_rates_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../results.dart';
import 'home_page.dart';
import 'destination_loading_screen.dart';
import 'package:carparkley/main.dart';
import 'package:carparkley/services/find_carparks.dart';
import 'package:carparkley/services/get_carpark_info.dart';
import 'package:carparkley/services/coordinate_converter.dart';
import 'package:carparkley/services/get_carpark_rates_details.dart';

class ResultsPage extends StatefulWidget {
  ResultsPage({this.carparks, this.lotType});
  final carparks;
  final lotType;
  static String id = "results_screen";

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  void initState() {
    super.initState();
    var carparklist = widget.carparks;
    print('Carparklist: $carparklist');
    print("\n\n\n");
    // getCarparkInfo();
    // getCoordinates();
  }
  //default distance

  String chosenSortType = 'Distance';

  // void getCarparkInfo() async {
  //   GetCarparkInfo().carparkInformation(destination);
  // }

  // void getCoordinates() async {
  //   var coordinates = await CoordinateConverter()
  //       .convert('28983.788791079794', '33554.5098132845');
  //   print(coordinates);
  // }

// dummy results

  @override
  Widget build(BuildContext context) {
    var carparkList = widget.carparks;
    String lotType = widget.lotType;
    print('carpark list in results screen $carparkList');
    List cpNameList = carparkList.keys.toList();
    List cpInfoList = carparkList.values.toList();
    print('cpNameList is $cpNameList');
    print('cpInfoList is $cpInfoList');
    print(cpNameList.length);

    dynamic checkHowMany() {
      if (cpNameList.length == 1) {
        var results = <Results>[
          Results(
              carparkname: cpNameList[0],
              rate: 'click to view',
              infoList: cpInfoList[0],
              vacancy: cpInfoList[0][1],
              distance: cpInfoList[0][3],
              lotType: lotType),
        ];
        return results
            .map((resultsrow) => DataRow(cells: [
                  DataCell(
                      Container(
                          width: 60, //SET width
                          child: Text(resultsrow.carparkname.toString())),
                      onTap: () {}),
                  DataCell(
                      Container(
                          width: 45, child: Text(resultsrow.rate.toString())),
                      onTap: () async {
                    print("finding detailed rates for : " +
                        resultsrow.carparkname);
                    var cpRatesDetails = await GetCarparkRatesDetails()
                        .carparkRatesDetails(
                            resultsrow.carparkname, resultsrow.lotType);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CarparkInfo(
                        carparkInformation: cpRatesDetails,
                        cpName: resultsrow.carparkname,
                        cpInfo: resultsrow.infoList,
                      );
                    }));
                  }),
                  DataCell(Text(resultsrow.vacancy.toString()), onTap: () {}),
                  DataCell(Text(resultsrow.lotType.toString()), onTap: () {}),
                  DataCell(Text(resultsrow.distance), onTap: () {})
                ]))
            .toList();
      } else {
        List<Results> results = [];
        int counter = 0;
        for (int i = 0; i < carparkList.length; i++) {
          if (double.parse(
                cpInfoList[i][3].substring(0, cpInfoList[i][3].length - 3),
              ) <
              2.0) {
            results.add(
              Results(
                  carparkname: cpNameList[i],
                  rate: 'click to view',
                  infoList: cpInfoList[i],
                  vacancy: cpInfoList[i][1],
                  distance: cpInfoList[i][3],
                  lotType: lotType),
              // Results(carparkname: 'C', rate: '0.5', vacancy: '20', distance: '300'),
              // Results(carparkname: 'D', rate: '0.7', vacancy: '12', distance: '120'),
              // Results(carparkname: 'E', rate: '0.5', vacancy: '1', distance: '500'),
              // Results(carparkname: 'F', rate: '0.5', vacancy: '20', distance: '300'),
              // Results(carparkname: 'G', rate: '0.7', vacancy: '12', distance: '120'),
              // Results(carparkname: 'H', rate: '0.5', vacancy: '1', distance: '500'),
            );
            return results
                .map(
                  (resultsrow) => DataRow(cells: [
                    DataCell(
                        Container(
                            width: 60, //SET width
                            child: Text(resultsrow.carparkname.toString())),
                        onTap: () {}),
                    DataCell(Container(width: 45, child: Text(resultsrow.rate)),
                        onTap: () async {
                      print("finding detailed rates for : " +
                          resultsrow.carparkname);
                      var cpRatesDetails = await GetCarparkRatesDetails()
                          .carparkRatesDetails(
                              resultsrow.carparkname, resultsrow.lotType);
                      print("Displaying page for: " +
                          resultsrow.carparkname.toString() +
                          " with cpInfo: " +
                          resultsrow.infoList.toString());
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CarparkInfo(
                          carparkInformation: cpRatesDetails,
                          cpName: resultsrow.carparkname,
                          cpInfo: resultsrow.infoList,
                        );
                      }));
                    }),
                    DataCell(Text(resultsrow.vacancy.toString()), onTap: () {}),
                    DataCell(Text(resultsrow.lotType.toString()), onTap: () {}),
                    DataCell(Text(resultsrow.distance), onTap: () {})
                  ]),
                )
                .toList();
          } else {
            SchedulerBinding.instance?.addPostFrameCallback((_) {
              Navigator.pushNamed(context, ErrorScreen.id);
            });
          }
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
          title: Text('Car Parks Found'),
          backgroundColor: Colors.blue[900],
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.keyboard_return),
            onPressed: () => {Navigator.pushNamed(context, HomePage.id)},
          )),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      height: 30,
                      margin: EdgeInsets.only(left: 180.0, right: 1.0),
                      child: Text(
                        "Sort By :",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                    child: Container(
                      height: 30,
                      margin: EdgeInsets.only(left: 2.0, right: 3.0),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.5),
                          color: Color(0xE5E5E5),
                          borderRadius: BorderRadius.circular(1.0)),
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton<String>(
                            hint: Text('Sort By'),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            items: [
                              DropdownMenuItem(
                                  child: Text('Rate'), value: 'Rate'),
                              DropdownMenuItem(
                                  child: Text('Vacancy'), value: 'Vacancy'),
                              DropdownMenuItem(
                                  child: Text('Distance'), value: 'Distance'),
                            ],
                            value: chosenSortType,
                            onChanged: (value) {
                              setState(() {
                                print(value);
                                chosenSortType = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.grey[100],
                child: DataTable(
                  dividerThickness: 2,
                  columnSpacing: 15,
                  dataRowHeight: 100,
                  columns: const <DataColumn>[
                    DataColumn(
                        label: Text('Car Park',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Rate',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Vacancy',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Lot Type',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Distance',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        tooltip: 'in metres'),
                  ],
                  rows: checkHowMany(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
