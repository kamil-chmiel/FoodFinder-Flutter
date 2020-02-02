import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 220,
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image(
                      image: AssetImage('assets/images/dish.png'),
                      fit: BoxFit.cover),
                ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text('Dish name',
                        style: TextStyle(
                          color: Colors.black,
                        )),
                  ),
                  Text('4.5', style: TextStyle(fontSize: 16)),
                  Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Icon(Icons.star, size: 18))
                ],
              ),
              Text('Place name',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18))
            ],
          ),
        ));
  }
}
