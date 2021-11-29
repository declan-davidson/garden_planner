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
    CardDefinition("Harvest", "Next up: {crop}", "harvest.jpg", "harvest", true),
    CardDefinition("Plan", "freeArea}m2 available", "plan.jpg", "plan", false),
    CardDefinition("Recipes", "Why not try {dish}?", "recipe.jpg", "recipes", true),
    CardDefinition("Environmental Impact", "How's my carbon footprint?", "env_imp.jpg", "environmental_impact", false)];
  late TabController _tabController;
  bool _carrotsPlanted = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
  }

  bool getCarrotsPlanted(){
    return _carrotsPlanted;
  }

  void toggleCarrotsPlanted(){
    _carrotsPlanted = !_carrotsPlanted;
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
                return createTappableCard(context, cards[i], getterCallback: getCarrotsPlanted, togglerCallback: toggleCarrotsPlanted);
              }
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