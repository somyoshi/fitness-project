import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.only(
        left: 14,
      ),
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(17),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 7, offset: Offset(2, 1))
          ]),
      child: Container(
        
        width: 200,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(17.0),
            bottomRight: Radius.circular(17.0),
            topLeft: Radius.circular(4.0),
            bottomLeft: Radius.circular(4.0),
          ),
        ),
      ),
    );
  }
}
