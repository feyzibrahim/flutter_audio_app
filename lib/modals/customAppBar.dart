import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.audiotrack,
                  color: Colors.white,
                  size: 20.0,
                ),
                onPressed: null,
              ),
              Text(
                'Audio Library',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20.0,
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.dashboard,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 18.0),
            child: Text(
              'Malayalam Audio Troll',
              style: TextStyle(
                  color: Colors.grey[600], fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}
