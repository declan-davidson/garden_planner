import 'package:flutter/material.dart';

class CardDefinition {
  String title, subtitle, imagePath;
  int id;

  CardDefinition(this.title, this.subtitle, this.imagePath, this.id);
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