import 'package:flutter/material.dart';
import 'package:food_finder/widgets/Banner.dart';
import 'package:food_finder/widgets/RestaurantCard.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedPricingTabId = 0;

  void openLocationSheet() {
    print('opening sheet');
  }

  void changePricingTab(int tabId) {
    setState(() {
      selectedPricingTabId = tabId;
    });
  }

  Widget buildTabItem(int id, String title) {
    final isSelected = selectedPricingTabId == id;

    return Expanded(
      child: GestureDetector(
          onTap: () => changePricingTab(id),
          child: Column(
            children: <Widget>[
              Text(title,
                  textAlign: TextAlign.center,
                  style: isSelected
                      ? TextStyle(
                          fontSize: 14,
                          fontFamily: 'Kentledge',
                          fontWeight: FontWeight.bold)
                      : TextStyle(
                          color: Colors.black.withAlpha(117),
                          fontSize: 14,
                          fontFamily: 'Kentledge',
                          fontWeight: FontWeight.bold)),
              isSelected
                  ? Icon(
                      Icons.brightness_1,
                      color: Colors.greenAccent,
                      size: 8,
                    )
                  : Container(
                      height: 8,
                    )
            ],
          )),
    );
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                                    labelStyle: TextStyle(
                                        color: Colors.grey.withAlpha(170))),
                              ),
                            ),
                            Icon(
                              Icons.search,
                              color: Colors.grey.withAlpha(170),
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
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: <Widget>[
                    AdBanner(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Row(
                        children: <Widget>[
                          buildTabItem(0, "JUST FOR YOU"),
                          buildTabItem(1, "CHEAP & FAST"),
                          buildTabItem(2, "BIG SPENDER")
                        ],
                      ),
                    ),
                    Container(
                        height: 250,
                        child: ListView.builder(
                          itemBuilder: (ctx, index) => RestaurantCard(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                        )),
                    Text('THE BEST RESTAURANTS NEARBY',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
