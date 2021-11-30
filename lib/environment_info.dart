import 'package:flutter/material.dart';

class EnvironmentInfo extends StatelessWidget{

    const EnvironmentInfo({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(

            appBar: AppBar(
                title: Text("Environment Screen")
            ), //App B4r
            body: Container(
                margin: EdgeInsets.fromLTRB(20,10,20,20),
                child: ListView(
                    children: [
                    Text(" "), 
                    Text("Collect Water",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),), 
                    Text("Instead of using water from your tap, try collecting water through more environmentally friendly methods. Click below to learn more!",
                    style: TextStyle(fontSize: 24),),
                    Text(" "),
                    Text("Make sure your crop is in season!",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                    Text("Growing your own crops is great, but make sure it is the correct time of year to grow them, otherwise you may be producing even more carbon dioxide than it would take to fly the vegetables in! Avoid synthetic light and heaters.",
                    style: TextStyle(fontSize: 24),),
                    Text(" "), 
                    Text("Keep on growing",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),), 
                    Text("Growing your own fruit and vegetables saves it coming from warmer climates such as Spain, which increases transport. Being able to produce these yourselves saves the need for lorries and planes!",
                    style: TextStyle(fontSize: 24),)
                    ]),
            )
        ); // Build
        
    }
} 