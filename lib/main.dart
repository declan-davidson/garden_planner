import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  static const List<Tab> _tabs = [Tab(text: "My Garden"), Tab(text: "Exchange")];
  List<String> fabLabels = ["Create", "List"];
  late TabController _tabController;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
    _tabController.addListener(() { 
      setState(() => _index = _tabController.index);
    });
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
          tabs: _tabs
        )
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SizedBox(
            height: 1000,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10)
                  ),
                  SizedBox(
                    height: 200,
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.network("https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg", height: 128, width: double.infinity, fit: BoxFit.none),
                          const ListTile(
                            title: Text("Harvest"), 
                            subtitle: Text("Next up: {crop}")
                          )
                        ],
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
                          Image.network("https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg", height: 128, width: double.infinity, fit: BoxFit.none),
                          const ListTile(
                            title: Text("Plan"), 
                            subtitle: Text("{freeArea}m2 available")
                          )
                        ],
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
                          Image.network("https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg", height: 128, width: double.infinity, fit: BoxFit.none),
                          const ListTile(
                            title: Text("Recipe"), 
                            subtitle: Text("Why not try {dish}?")
                          )
                        ],
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
                          Image.network("https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg", height: 128, width: double.infinity, fit: BoxFit.none),
                          const ListTile(
                            title: Text("Environmental Impact"), 
                            subtitle: Text("How's my carbon footprint?")
                          )
                        ],
                      )
                    )
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10)
                  ),
                ]
              )
            )
          ),
          Scaffold(
            floatingActionButton: FloatingActionButton.extended(
              label: const Text("List"),
              icon: const Icon(Icons.add_sharp),
              onPressed: () => {}
            ),
          )
        ]
      )
    );
  }
}