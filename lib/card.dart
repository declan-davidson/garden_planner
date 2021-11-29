import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'plan.dart';

class ExpandedCardListItem {
  late Text title, subtitle;
  late Icon icon;

  ExpandedCardListItem(String title, String subtitle, String iconPath){
    this.title = Text(title);
    this.subtitle = Text(subtitle);
    icon = const Icon(Icons.agriculture_sharp);
  }
}

List<ExpandedCardListItem> noCarrotHarvestItems = [
  ExpandedCardListItem("Potatoes", "Harvest on June 1st", "somePath")
];

List<ExpandedCardListItem> noCarrotRecipeItems = [
  ExpandedCardListItem("Dauphinoise potatoes", "Requires potatoes", "somePath"),
  ExpandedCardListItem("Potato and leek soup", "Requires potatoes, leeks", "somePath")
];

List<ExpandedCardListItem> carrotHarvestItems = [
  ExpandedCardListItem("Carrots", "Harvest on May 15th", "somePath")
] + noCarrotHarvestItems;

List<ExpandedCardListItem> carrotRecipeItems = [
  ExpandedCardListItem("Carrot cake", "Requires carrots", "somePath"),
  ExpandedCardListItem("Chicken casserole", "Requires carrots, potatoes", "somePath")
] + noCarrotRecipeItems;

class CardDefinition {
  String title, subtitle, imagePath, id;
  bool expandable;

  CardDefinition(this.title, this.subtitle, this.imagePath, this.id, this.expandable);
}

class ExpandedCard extends StatelessWidget {
  final CardDefinition card;
  bool carrotsPlanted;

  ExpandedCard(this.card, this.carrotsPlanted, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    List<ExpandedCardListItem> listItems = [];
    if(card.id == "harvest"){
      if(carrotsPlanted){
        listItems = carrotHarvestItems;
      }
      else{
        listItems = noCarrotHarvestItems;
      }
    }
    else if(card.id == "recipes"){
      if(carrotsPlanted){
        listItems = carrotRecipeItems;
      }
      else{
        listItems = noCarrotRecipeItems;
      }
    }

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
                tag: card.id,
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
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: listItems.length,
                  itemBuilder: (BuildContext c, int i) {
                    return ListTile(
                      title: listItems[i].title,
                      subtitle: listItems[i].subtitle,
                      leading: listItems[i].icon
                    );
                  }
                )
              )
            ]
          )
        )
      )
    );
  }
}

GestureDetector createTappableCard(BuildContext context, CardDefinition card, {bool Function()? getterCallback, VoidCallback? togglerCallback}) {
  var onTap = () => Navigator.push(context, PageTransition(child: _PlaceHolderPage(), type: PageTransitionType.rightToLeft, duration: Duration(milliseconds: 200), reverseDuration: Duration(milliseconds: 200)));

  List<Widget> cardBody = [
    Image.asset(card.imagePath, height: 128, width: double.infinity, fit: BoxFit.fitWidth),
    ListTile(
      title: Text(card.title, style: const TextStyle(fontWeight: FontWeight.bold)), 
      subtitle: Text(card.subtitle)
    )
  ];

  if(card.expandable){
    onTap = () => Navigator.push(context, MaterialPageRoute(builder: (context) => ExpandedCard(card, (getterCallback != null ? getterCallback() : false))));

    //Have card use Hero transition
    cardBody[0] = Hero(
        tag: card.id,
        child: Image.asset(card.imagePath, height: 128, width: double.infinity, fit: BoxFit.fitWidth)
    );
  }

  if(card.id == "plan"){
    onTap = () => Navigator.push(context, PageTransition(child: PlanPage(getterCallback != null ? getterCallback : () => false ,togglerCallback != null ? togglerCallback : () => {}), type: PageTransitionType.rightToLeft, duration: Duration(milliseconds: 200), reverseDuration: Duration(milliseconds: 200)));
  }

  //Callback prop is probably not needed; remove later
  return TappableCard(
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
    onTap: onTap,
    callback: getterCallback,
  );
}

class TappableCard extends GestureDetector{
  Function? callback;

  TappableCard({Widget? child, var onTap, Key? key, this.callback}) : super(key: key, child: child, onTap: onTap);
}

class _PlaceHolderPage extends StatelessWidget{
  _PlaceHolderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Placeholder"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => {})
    );
  }
}