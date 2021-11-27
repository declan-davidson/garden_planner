import 'package:flutter/material.dart';

class HarvestPage extends StatelessWidget{

    const HarvestPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(

            // > Marty - Added a return button for now
            floatingActionButton: FloatingActionButton(
                onPressed: (){
                    Navigator.pop(context);
                }
            ),

            appBar: AppBar(
                title: Text("Harvest Screen")
            ), //App BAr
        ); // Build
    }
}