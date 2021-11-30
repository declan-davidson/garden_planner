import 'package:flutter/material.dart';
//import 'package:garden_planner/environment_info.dart';
import 'package:page_transition/page_transition.dart';

// > Marty
import 'package:garden_planner/environment_page.dart';

class CardDefinition {
  String title, subtitle, imagePath;
  int id;
  bool expandable;

  CardDefinition(this.title, this.subtitle, this.imagePath, this.id, this.expandable);
}

class ExpandedCard extends StatelessWidget {
  final CardDefinition card;

  ExpandedCard(this.card, {Key? key}) : super(key: key);

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

GestureDetector createTappableCard(BuildContext context, CardDefinition card) {
  var onTap = () => Navigator.push(context, PageTransition(child: _PlaceHolderPage(), type: PageTransitionType.rightToLeft, duration: Duration(milliseconds: 200), reverseDuration: Duration(milliseconds: 200)));
  List<Widget> cardBody = [
    Image.asset(card.imagePath, height: 128, width: double.infinity, fit: BoxFit.fitWidth),
    ListTile(
      title: Text(card.title, style: const TextStyle(fontWeight: FontWeight.bold)), 
      subtitle: Text(card.subtitle)
    )
  ];

  if(card.expandable){
    onTap = () => Navigator.push(context, MaterialPageRoute(builder: (context) => ExpandedCard(card)));

    //Have card use Hero transition
    cardBody[0] = Hero(
        tag: "${card.id}",
        child: Image.asset(card.imagePath, height: 128, width: double.infinity, fit: BoxFit.fitWidth)
    );
  }

  // > Marty
  if(card.title == "Environmental Impact"){

    onTap = () => Navigator.push(context, PageTransition(child: EnvironmentPage(), type: PageTransitionType.rightToLeft, duration: Duration(milliseconds: 200), reverseDuration: Duration(milliseconds: 200)));
    //onTap = () => Navigator.push(context, MaterialPageRoute(builder: (context) => InteractiveGraph() ));

    // //Have card use Hero transition
    // cardBody[0] = Hero(
    //     tag: "${card.id}",
    //     child: Image.asset(card.imagePath, height: 128, width: double.infinity, fit: BoxFit.fitWidth)
    // );
  }

  return GestureDetector(
    child: SizedBox(
      height: 200,
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: cardBody
        )
      )
    ),
    onTap: onTap
  );
}

class _PlaceHolderPage extends StatelessWidget{
  const _PlaceHolderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Placeholder"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      )
    );
  }
}