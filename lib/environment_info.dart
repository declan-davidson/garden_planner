import 'package:flutter/material.dart';

class EnvironmentInfo extends StatelessWidget{

    const EnvironmentInfo({Key? key}) : super(key: key);

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
                title: Text("Environment Screen")
            ), //App B4r
        ); // Build
    }
} 