import 'package:flutter/material.dart';

class PlanPage extends StatelessWidget{

    const PlanPage({Key? key}) : super(key: key);

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
                title: Text("Planning Screen")
            ), //App BAr
        ); // Build
    }
}