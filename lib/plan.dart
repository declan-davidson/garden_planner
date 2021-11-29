import 'package:flutter/material.dart';
import 'card.dart';

class PlanPage extends StatefulWidget {
  CardDefinition card;

  PlanPage(this.card, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlanPageState(card);
}

class _PlanPageState extends State<PlanPage> with SingleTickerProviderStateMixin{
  CardDefinition card;

  void _toggleCarrotsPlanted(){
    setState(() {
      card.toggleCarrotsPlanted!();
    });
  }

  _PlanPageState(this.card);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Garden Planner"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text("Carrot planting status: ${card.getCarrotsPlanted!()}"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _toggleCarrotsPlanted,
        label: const Text("Toggle carrot planting")
      ),
    );
  }
}