import 'package:flutter/material.dart';
import 'card.dart';
//import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> _tabs = [
    Tab(text: "My Garden"),
    Tab(text: "Exchange")
  ];
  List<CardDefinition> cards = [
    CardDefinition("Harvest", "Next up: {crop}", "harvest.jpg", 1, true),
    CardDefinition("Plan", "freeArea}m2 available", "plan.jpg", 2, false),
    CardDefinition("Recipes", "Why not try {dish}?", "recipe.jpg", 3, true),
    CardDefinition("Environmental Impact", "How's my carbon footprint?",
        "env_imp.jpg", 4, false)
  ];

  late TabController _tabController;
  late GoogleMapController mapController;

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Garden Planner"),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            bottom: TabBar(
                controller: _tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                indicatorColor: Colors.white,
                tabs: _tabs)),
        body: TabBarView(controller: _tabController, children: [
          Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ListView.builder(
                  itemCount: cards.length,
                  itemBuilder: (BuildContext c, int i) {
                    return createTappableCard(context, cards[i]);
                  })),
          Scaffold(
            body: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              markers: _markers.values.toSet(),
            ),
          ),
        ]));
  }
}
