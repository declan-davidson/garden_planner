import 'package:flutter/material.dart';
import 'card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  static const List<Tab> _tabs = [Tab(text: "My Garden"), Tab(text: "Exchange")];
  List<CardDefinition> cards = [
    CardDefinition("Harvest", "Next up: {crop}", "harvest.jpg", 1),
    CardDefinition("Plan", "freeArea}m2 available", "plan.jpg", 2),
    CardDefinition("Recipes", "Why not try {dish}?", "recipe.jpg", 3),
    CardDefinition("Environmental Impact", "How's my carbon footprint?", "env_imp.jpg", 4)];
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
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (BuildContext c, int i) {
                var onTap;
                if(i == 0 || i == 2) onTap = () => Navigator.push(context, MaterialPageRoute(builder: (context) => ExpandedCard(cards[i])));

                return GestureDetector(
                  child: SizedBox(
                    height: 200,
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Hero(
                            tag: "${cards[i].id}",
                            child: Image.asset(cards[i].imagePath, height: 128, width: double.infinity, fit: BoxFit.fitWidth)
                          ),
                          ListTile(
                            title: Text(cards[i].title, style: TextStyle(fontWeight: FontWeight.bold),), 
                            subtitle: Text(cards[i].subtitle)
                          )
                        ],
                      )
                    )
                  ),
                  onTap: onTap,
                );
              }
            )
          ),
          /* SizedBox(
            height: 1000,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: 
              /* child: ListView(
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
                          Image.asset("harvest.jpg", height: 128, width: double.infinity, fit: BoxFit.fitWidth),
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
                          Image.asset("plan.jpg", height: 128, width: double.infinity, fit: BoxFit.fitWidth),
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
                          Image.asset("recipe.jpg", height: 128, width: double.infinity, fit: BoxFit.fitWidth),
                          const ListTile(
                            title: Text("Recipes"), 
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
                          Image.asset("env_imp.jpg", height: 128, width: double.infinity, fit: BoxFit.fitWidth),
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
              ) */
            )
          ), */
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