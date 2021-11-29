import 'package:flutter/material.dart';
import 'card.dart';
import 'exchange.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  static const List<Tab> _tabs = [Tab(text: "My Garden"), Tab(text: "Exchange")];
  late TabController _tabController;
  bool _carrotsPlanted = false; //To keep track of whether carrots have been planted
  late List<CardDefinition> cards;

  bool getCarrotsPlanted(){
    return _carrotsPlanted;
  }

  void toggleCarrotsPlanted(){
    _carrotsPlanted = !_carrotsPlanted;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
    cards = [
    CardDefinition("Harvest", "Next up: {crop}", "harvest.jpg", "harvest", true, getCarrotsPlanted: getCarrotsPlanted),
    CardDefinition("Plan", "freeArea}m2 available", "plan.jpg", "plan", false, getCarrotsPlanted: getCarrotsPlanted, toggleCarrotsPlanted: toggleCarrotsPlanted),
    CardDefinition("Recipes", "Why not try {dish}?", "recipe.jpg", "recipes", true, getCarrotsPlanted: getCarrotsPlanted),
    CardDefinition("Environmental Impact", "How's my carbon footprint?", "env_imp.jpg", "environmental_impact", false)];
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
          Exchange()
        ]));
  }
}
