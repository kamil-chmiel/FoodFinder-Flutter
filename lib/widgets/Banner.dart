import 'package:flutter/material.dart';

class AdBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                        color: Colors.white, fontSize: 18),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}