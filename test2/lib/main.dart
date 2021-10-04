import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:provider/provider.dart';
import 'package:test2/provider/Infinite_provider.dart';

import 'infinite_scroll/infinite_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InfiniteProvider())
      ],
      child: MyApp()
    ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'equatable',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Screen()
    );
  }
}

class Screen extends StatefulWidget {

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('equatable'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => InfinitePage())),
          child: Container(
            width: 200,
            height: 50,
            color: Colors.red,
            child: Center(child: Text('인피니트 스크롤'))
          ),
        ),
      ),
    );
  }
}

