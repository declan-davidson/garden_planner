import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Exchange extends StatefulWidget{
  const Exchange({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExchangeState();
}

class _ExchangeState extends State<Exchange>{
  late Widget Function() getBottomWidget;
  late GoogleMapController mapController;
  late TextEditingController textController;

  final LatLng _center = const LatLng(55.860916, -4.251433);
  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    setState(() {
      _markers.clear();
      const marker1 = Marker(
        markerId: MarkerId("Garden_1"),
        position: LatLng(55.8724, -4.2900),
        infoWindow: InfoWindow(
          title: "West End Garden",
          snippet: "Looking to exchange crops!",
        ),
      );
      const marker2 = Marker(
        markerId: MarkerId("Garden_2"),
        position: LatLng(55.85111, -4.23722),
        infoWindow: InfoWindow(
          title: "East End Garden",
          snippet: "Looking to exchange crops!",
        ),
      );
      _markers["garden_1"] = marker1;
      _markers["garden_2"] = marker2;
    });
  }

  Widget produceMap() {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          markers: _markers.values.toSet(),
        )
      )
    );
  }

  Widget produceCards() {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        SizedBox(
          height: 200,
          child: Card(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("harvest.jpg", height: 128, width: double.infinity, fit: BoxFit.fitWidth),
                const ListTile(
                  title: Text("Vegetable", style: TextStyle(fontWeight: FontWeight.bold)), 
                  subtitle: Text("Specific location")
                )
              ]
            )
          )
        ),
        SizedBox(
          height: 200,
          child: Card(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("harvest.jpg", height: 128, width: double.infinity, fit: BoxFit.fitWidth),
                const ListTile(
                  title: Text("Another vegetable", style: TextStyle(fontWeight: FontWeight.bold)), 
                  subtitle: Text("Specific location 2")
                )
              ]
            )
          )
        ),
      ],
    );
  }

  Widget produceBottomWidget(){
    return const Center(
      child: Text("Enter a location or use the map")
    );
  }

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    getBottomWidget = produceBottomWidget;
  }

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: Column(
        children: [
          TextFormField(
            controller: textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Location",
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    getBottomWidget = produceMap;
                  });
                },
                icon: const Icon(Icons.location_pin))
            ),
            onFieldSubmitted: (String value) {
              setState(() {
                getBottomWidget = produceCards;
              });
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              thickness: 1,
            )
          ),
          getBottomWidget()
        ],
      )
    );
  }
}