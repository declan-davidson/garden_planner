import 'package:flutter/material.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'environment_info.dart';
// class EnvironmentPage extends StatelessWidget{

//     const EnvironmentPage({Key? key}) : super(key: key);

//     @override
//     Widget build(BuildContext context) {
//         return Scaffold(

//             // > Marty - Added a return button for now
//             floatingActionButton: FloatingActionButton(
//                 onPressed: (){
//                     Navigator.pop(context);
//                 }
//             ),

//             appBar: AppBar(
//                 title: Text("Environmental Impact")
//             ), //App B4r
//         ); // Build
//     }

    
// }

class CropData {
  CropData(this.stage, this.emissions);
  final String stage;
  final double? emissions;
}

late TooltipBehavior _tooltipBehavior;
late ZoomPanBehavior _zoomPanBehavior;
late SelectionBehavior _selectionBehavior;

class EnvironmentPage extends StatefulWidget {


    

    @override
    _InteractiveGraphState createState() => _InteractiveGraphState();
}

class _InteractiveGraphState extends State<EnvironmentPage> {

    //final List<ListItem> items;

    String printText (String text) {
        print(text);
        return 'Hello $text';
    }     


   @override
    void initState(){
      _tooltipBehavior =  TooltipBehavior(enable: true);
      
      _zoomPanBehavior = ZoomPanBehavior(
        enableMouseWheelZooming : true,
        enablePinching: true,
        zoomMode: ZoomMode.x,
        enablePanning: true
      );
      _selectionBehavior = SelectionBehavior(
          enable: true,
          selectedColor: Colors.blue,
          unselectedColor: Colors.grey
      );
        
      super.initState(); 
    }
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Environmental Impact'),
            ),
            body: Container(//Center(
                
                child: new Column(

                    children: [
                        //Center(
                        Container(
                        child:
                            
                            SfCartesianChart(

                                title: ChartTitle(
                                text: 'Environmental Impact(Tomatoes)',
                            
                                textStyle: TextStyle(
                                
                                fontFamily: 'Roboto',
                                fontStyle: FontStyle.italic,
                                fontSize: 20,
                            )
                            ),
                            // Enables the tooltip for all the series in chart
                            
                            tooltipBehavior: _tooltipBehavior,
                            zoomPanBehavior: _zoomPanBehavior,

                            // Initialize category axis
                            primaryXAxis: CategoryAxis(
                            title: AxisTitle(text:'Stage of growth')
                            ),
                            primaryYAxis: NumericAxis(
                            title: AxisTitle(text:'Emissions (kg of CO2 per kg)')
                            ),
                            palette: <Color>[
                                Colors.green,
                                Colors.red
                            ],
                            legend: Legend(
                            isVisible: true
                            ),
                            series: <ChartSeries>[
                                // Initialize line series
                                LineSeries<CropData, String>(
                                    // Enables the tooltip for individual series
                                    enableTooltip: true, 
                                    selectionBehavior: _selectionBehavior,
                                    animationDuration: 6000,
                                    dataSource: [
                                        // Bind data source
                                        CropData('Farming', 0.2),
                                        CropData('Processing', 0),
                                        CropData('Packaging', 0),
                                        CropData('Transport', 0)
                                    ],
                                    xValueMapper: (CropData emissions, _) => emissions.stage,
                                    yValueMapper: (CropData emissions, _) => emissions.emissions,
                                    markerSettings: MarkerSettings(
                                        isVisible: true,
                                        shape: DataMarkerType.diamond
                                    ),
                                    name: 'Growing in Garden'
                                ),
                                LineSeries<CropData, String>(
                                    // Enables the tooltip for individual series
                                    enableTooltip: true, 
                                    selectionBehavior: _selectionBehavior,
                                    animationDuration: 6000,
                                    dataSource: [
                                        // Bind data source
                                        CropData('Farming', 0.3),
                                        CropData('Processing', 0.2),
                                        CropData('Packaging', 0.1),
                                        CropData('Transport', 0.5)
                                    ],
                                    xValueMapper: (CropData emissions, _) => emissions.stage,
                                    yValueMapper: (CropData emissions, _) => emissions.emissions,
                                    markerSettings: MarkerSettings(
                                        isVisible: true,
                                        shape: DataMarkerType.diamond
                                    ),
                                    name: 'Buying from Shop'
                                )
                            ]
                        )
                    ), //),
                    // Container(

                    //     color: Colors.green,
                    //     width: 60.0,
                    //     height: 20.0,
                    //     child : Text("Learn More!",
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.bold ,
                    //         color: Colors.white)
                    //     )
                    // ),
                    TextButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                        ),
                        onPressed: () { 
                            Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => EnvironmentPage()
                            ) // Material page route
                          ); // Navigator.push
                        },
                        child: Text('Learn More!'),
                    ),
                    Container(
                        child:
                            
                            SfCartesianChart(

                                title: ChartTitle(
                                text: 'Environmental Impact (Potatoes)',
                            
                                textStyle: TextStyle(
                                
                                fontFamily: 'Roboto',
                                fontStyle: FontStyle.italic,
                                fontSize: 20,
                            )
                            ),
                            // Enables the tooltip for all the series in chart
                            
                            tooltipBehavior: _tooltipBehavior,
                            zoomPanBehavior: _zoomPanBehavior,

                            // Initialize category axis
                            primaryXAxis: CategoryAxis(
                            title: AxisTitle(text:'Stage of growth')
                            ),
                            primaryYAxis: NumericAxis(
                            title: AxisTitle(text:'Emissions (kg of CO2 per kg)')
                            ),
                            palette: <Color>[
                                Colors.green,
                                Colors.red
                            ],
                            legend: Legend(
                            isVisible: true
                            ),
                            series: <ChartSeries>[
                                // Initialize line series
                                LineSeries<CropData, String>(
                                    // Enables the tooltip for individual series
                                    enableTooltip: true, 
                                    selectionBehavior: _selectionBehavior,
                                    animationDuration: 6000,
                                    dataSource: [
                                        // Bind data source
                                        CropData('Farming', 0.1),
                                        CropData('Processing', 0),
                                        CropData('Packaging', 0),
                                        CropData('Transport', 0)
                                    ],
                                    xValueMapper: (CropData emissions, _) => emissions.stage,
                                    yValueMapper: (CropData emissions, _) => emissions.emissions,
                                    markerSettings: MarkerSettings(
                                        isVisible: true,
                                        shape: DataMarkerType.diamond
                                    ),
                                    name: 'Growing in Garden'
                                ),
                                LineSeries<CropData, String>(
                                    // Enables the tooltip for individual series
                                    enableTooltip: true, 
                                    selectionBehavior: _selectionBehavior,
                                    animationDuration: 6000,
                                    dataSource: [
                                        // Bind data source
                                        CropData('Farming', 0.4),
                                        CropData('Processing', 0.1),
                                        CropData('Packaging', 0.3),
                                        CropData('Transport', 0.4)
                                    ],
                                    xValueMapper: (CropData emissions, _) => emissions.stage,
                                    yValueMapper: (CropData emissions, _) => emissions.emissions,
                                    markerSettings: MarkerSettings(
                                        isVisible: true,
                                        shape: DataMarkerType.diamond
                                    ),
                                    name: 'Buying from Shop'
                                )
                            ]
                        )
                    ),
                        Container(
                        child:
                            
                            SfCartesianChart(

                                title: ChartTitle(
                                text: 'Environmental Impact (Leeks)',
                            
                                textStyle: TextStyle(
                                
                                fontFamily: 'Roboto',
                                fontStyle: FontStyle.italic,
                                fontSize: 20,
                            )
                            ),
                            // Enables the tooltip for all the series in chart
                            
                            tooltipBehavior: _tooltipBehavior,
                            zoomPanBehavior: _zoomPanBehavior,

                            // Initialize category axis
                            primaryXAxis: CategoryAxis(
                            title: AxisTitle(text:'Stage of growth')
                            ),
                            primaryYAxis: NumericAxis(
                            title: AxisTitle(text:'Emissions (kg of CO2 per kg)')
                            ),
                            palette: <Color>[
                                Colors.green,
                                Colors.red
                            ],
                            legend: Legend(
                            isVisible: true
                            ),
                            series: <ChartSeries>[
                                // Initialize line series
                                LineSeries<CropData, String>(
                                    // Enables the tooltip for individual series
                                    enableTooltip: true, 
                                    selectionBehavior: _selectionBehavior,
                                    animationDuration: 6000,
                                    dataSource: [
                                        // Bind data source
                                        CropData('Farming', 0.1),
                                        CropData('Processing', 0.1),
                                        CropData('Packaging', 0),
                                        CropData('Transport', 0)
                                    ],
                                    xValueMapper: (CropData emissions, _) => emissions.stage,
                                    yValueMapper: (CropData emissions, _) => emissions.emissions,
                                    markerSettings: MarkerSettings(
                                        isVisible: true,
                                        shape: DataMarkerType.diamond
                                    ),
                                    name: 'Growing in Garden'
                                ),
                                LineSeries<CropData, String>(
                                    // Enables the tooltip for individual series
                                    enableTooltip: true, 
                                    selectionBehavior: _selectionBehavior,
                                    animationDuration: 6000,
                                    dataSource: [
                                        // Bind data source
                                        CropData('Farming', 0.3),
                                        CropData('Processing', 0.1),
                                        CropData('Packaging', 0.2),
                                        CropData('Transport', 0.2)
                                    ],
                                    xValueMapper: (CropData emissions, _) => emissions.stage,
                                    yValueMapper: (CropData emissions, _) => emissions.emissions,
                                    markerSettings: MarkerSettings(
                                        isVisible: true,
                                        shape: DataMarkerType.diamond
                                    ),
                                    name: 'Buying from Shop'
                                )
                            ]
                        )
                    ),
                    Container(
                        color: Colors.red[600],
                        width: 48.0,
                        height: 10.0
                    ),
                    Container(
                        color: Colors.green,
                        child: Text(printText("Hello")) 
                    )
                ]
            )     
        )
        );
    }
}












/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}

// // > mock list to test
// final items = List<ListItem>.generate(
//   10,
//   (i) => i % 6 == 0
//       ? HeadingItem('Heading $i')
//       : MessageItem('Sender $i', 'Message body $i'),
// );

// ListView.builder(
//   // Let the ListView know how many items it needs to build.
//   itemCount: items.length,
//   // Provide a builder function. This is where the magic happens.
//   // Convert each item into a widget based on the type of item it is.
//   itemBuilder: (context, index) {
//     final item = items[index];

//     return ListTile(
//       title: item.buildTitle(context),
//       subtitle: item.buildSubtitle(context),
//     );
//   },
// )


                    // child: ListView.builder(
                    //     // Let the ListView know how many items it needs to build.
                    //     itemCount: items.length,
                    //     // Provide a builder function. This is where the magic happens.
                    //     // Convert each item into a widget based on the type of item it is.
                    //     itemBuilder: (context, index) {
                    //         final item = items[index];

                    //         return ListTile(
                    //         title: item.buildTitle(context),
                    //         subtitle: item.buildSubtitle(context),
                    //         );
                    //     },
                    // )