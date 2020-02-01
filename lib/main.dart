import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void openLocationSheet() {
    print('opening sheet');
  }

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Image(
                      image: AssetImage('assets/images/avatar.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Your location',
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Kentledge',
                                fontWeight: FontWeight.w400,
                                fontSize: 15)),
                        GestureDetector(
                            onTap: openLocationSheet,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Krowodrza, Krakow',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18),
                                ),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.grey.withAlpha(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Restaurant or cuisine',
                                    hoverColor: Colors.grey),
                              ),
                            ),
                            Icon(
                              Icons.search,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child:
                        Icon(Icons.developer_board, color: Colors.greenAccent),
                  )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.greenAccent,
              ),
              child: Stack(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/burgerBox.png'),
                    fit: BoxFit.fill,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 37, left: 27),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'NEW!',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 25),
                          ),
                          Text(
                            '20 new In-n-Out places',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18),
                          ),
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
