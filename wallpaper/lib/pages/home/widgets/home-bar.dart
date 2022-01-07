import 'package:flutter/material.dart';

class HomeBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.category),
          Icon(Icons.category),
          Icon(Icons.category),
          Icon(Icons.category),
        ],
      ),
    );
  }
}