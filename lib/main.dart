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
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ExpandedCard(cards[i]))),
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

class CardDefinition {
  String title, subtitle, imagePath;
  int id;

  CardDefinition(this.title, this.subtitle, this.imagePath, this.id);
}

class ExpandedCard extends StatelessWidget {
  CardDefinition card;

  ExpandedCard(this.card);

  @override
  Widget build(BuildContext context){
    //A structural widget that displays full screen minus OS items like the status bar
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0
        ),
        extendBodyBehindAppBar: true, //Body becomes full screen
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: "${card.id}",
                child: Image.asset(card.imagePath, scale: 1.0, repeat: ImageRepeat.noRepeat, fit: BoxFit.fitWidth, height: MediaQuery.of(context).size.height / 5)
              ),
              ListTile(
                title: Text(card.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                subtitle: Text(card.subtitle)
              ),
              const Divider(
                height: 20,
                thickness: 1
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("Some details here", style: TextStyle(fontSize: 25))
              )
            ]
          )
        )
      )
    );
  }
}