import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
  static const List<Tab> _tabs = [Tab(text: "Plans"), Tab(text: "Exchange")];
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
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.green,
          unselectedLabelColor: Colors.green,
          indicatorColor: Colors.green,
          tabs: _tabs
        )
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Column(
            children: [
              Card(
                color: Colors.grey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    ListTile(
                      title: Text("Title 1"),
                      subtitle: Text("Subtitle 1")
                    )
                  ],
                )
              ),
              Card(
                color: Colors.green,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    ListTile(
                      title: Text("Title 2"),
                      subtitle: Text("Subtitle 2")
                    )
                  ],
                )
              )
            ],
          ),
          const Center(
            child: Text("Tab 2")
          )
        ]
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(fabLabels[_index].toString()),
        icon: const Icon(Icons.add_sharp),
        onPressed: () => {}
      ),
    );
  }
}