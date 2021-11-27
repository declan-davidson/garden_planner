import 'package:flutter/material.dart';

class RecipesPage extends StatelessWidget{

    const RecipesPage({Key? key}) : super(key: key);

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
                title: Text("Recipes Screen")
            ), //App Bar
        ); // Build
    }
}