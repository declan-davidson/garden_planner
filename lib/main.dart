import 'package:flutter/material.dart';
import 'home_page.dart';
import 'environment_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Load in the vegetable values 

  // // > mock list to test
  // final items = List<ListItem>.generate(
  //   10,
  //   (i) => i % 6 == 0
  //       ? HeadingItem('Heading $i')
  //       : MessageItem('Sender $i', 'Message body $i'),
  // );

  // <
   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Garden Planner',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}