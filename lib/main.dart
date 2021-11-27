import 'package:flutter/material.dart';
import 'package:garden_planner/environment_page.dart';
import 'package:garden_planner/harvest_page.dart';
import 'package:garden_planner/plan_page.dart';
import 'package:garden_planner/recipes_page.dart';

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
                  SizedBox( // > HARVEST
                    height: 200,
                    child: Card(
                      color: Colors.white,
                      // > Marty 
                      child: new InkWell(
                        onTap: (){
                          // # test - prints in command line print("tapped");
                          Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => HarvestPage()
                            )
                          ); 
                        },
                        // <  
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("harvest.jpg", height: 128, width: double.infinity, fit: BoxFit.fitWidth),
                            const ListTile(
                              title: Text("Harvest"), 
                              subtitle: Text("Next up: {crop}")
                            )
                          ],
                        ) // column
                      ) // inkwell
                    )
                  ),
                  SizedBox( // > PLANNING 
                    height: 200,
                    child: Card(
                      color: Colors.white,
                      // > Marty 
                      child: new InkWell(
                        onTap: (){
                          // # test - prints in command line print("tapped");
                          Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => PlanPage()
                            )
                          ); // Navigator.push
                        },
                        // <  
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("plan.jpg", height: 128, width: double.infinity, fit: BoxFit.fitWidth),
                            const ListTile(
                              title: Text("Plan"), 
                              subtitle: Text("{freeArea}m2 available")
                            )
                          ],
                        ) // Column
                      ) // Inkwell
                    )
                  ),
                  SizedBox( // > RECIPES 
                    height: 200,
                    child: Card(
                      color: Colors.white,
                      // > Marty 
                      child: new InkWell(
                        onTap: (){
                          // # test - prints in command line print("tapped");
                          Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => RecipesPage()
                            )
                          ); // Navigator.push
                        },
                        // <  
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("recipe.jpg", height: 128, width: double.infinity, fit: BoxFit.fitWidth),
                            const ListTile(
                              title: Text("Recipes"), 
                              subtitle: Text("Why not try {dish}?")
                            )
                          ],
                        ) // Column
                      ) // Inkwell
                    )
                  ),
                  SizedBox( // > ENVIRONMENT 
                    height: 200,
                    child: Card(
                      color: Colors.white,

                      // > Marty 
                      child: new InkWell(
                        onTap: (){
                          // # test - prints in command line print("tapped");
                          Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => EnvironmentPage()
                            )
                          ); // Navigator.push
                        },
                      // <  
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("env_imp.jpg", height: 128, width: double.infinity, fit: BoxFit.fitWidth),
                            const ListTile(
                              title: Text("Environmental Impact hello world"), 
                              subtitle: Text("How's my carbon footprint?"),
                            )
                          ],
                        )
                      ) // Inkwell makes the card clickable                    
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