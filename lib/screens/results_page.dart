import 'package:flutter/material.dart';
import '../results.dart';
import 'home_page.dart';
import 'destination_loading_screen.dart';
import 'package:carparkley/main.dart';

class ResultsPage extends StatefulWidget {
  ResultsPage({@required this.carparks});
  final carparks;
  static String id = "results_screen";

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  void initState() {
    super.initState();
    var carparklist = widget.carparks;
    print(carparklist);
  }
  //default distance

  String chosenSortType = 'Distance';

// dummy results

  @override
  Widget build(BuildContext context) {
    var carparkList = widget.carparks;
    var results = <Results>[
      Results(
          carparkname: carparkList[0],
          rate: '0.50',
          vacancy: '2',
          distance: '100'),
      Results(
          carparkname: carparkList[1],
          rate: '0.75',
          vacancy: '2',
          distance: '100'),
      Results(
          carparkname: carparkList[2],
          rate: '0.5',
          vacancy: '20',
          distance: '300'),
      Results(
          carparkname: carparkList[3],
          rate: '0.7',
          vacancy: '12',
          distance: '120'),
      Results(
          carparkname: carparkList[4],
          rate: '0.5',
          vacancy: '1',
          distance: '500'),
      Results(
          carparkname: carparkList[5],
          rate: '0.5',
          vacancy: '20',
          distance: '300'),
      Results(
          carparkname: carparkList[6],
          rate: '0.7',
          vacancy: '12',
          distance: '120'),
      Results(
          carparkname: carparkList[7],
          rate: '0.5',
          vacancy: '1',
          distance: '500'),
    ];
    return Scaffold(
      appBar: AppBar(
          title: Text('Car Parks Found'),
          backgroundColor: Colors.blue[900],
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.keyboard_return),
            onPressed: () => Navigator.pushNamed(context, HomePage.id),
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
                  columnSpacing: 40,
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
                        label: Text('Distance',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        tooltip: 'in metres'),
                  ],
                  rows: results
                      .map(
                        (resultsrow) => DataRow(cells: [
                          DataCell(
                              Container(
                                  width: 60, //SET width
                                  child: Text(resultsrow.carparkname)),
                              onTap: () {
                            print("movetonextpage");
                          }),
                          DataCell(Text(resultsrow.rate), onTap: () {
                            print("movetonextpage");
                          }),
                          DataCell(Text(resultsrow.vacancy), onTap: () {
                            print("movetonextpage");
                          }),
                          DataCell(Text(resultsrow.distance), onTap: () {
                            print("movetonextpage");
                          })
                        ]),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}