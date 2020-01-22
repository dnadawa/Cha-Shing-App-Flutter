import 'package:cha_shing/screens/credit-repair-1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tile extends StatelessWidget {

  final String text;
  final Widget page;

  const Tile({Key key, this.text, this.page}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(40, 30, 20, 0),
        child: GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => page),
            );
          },
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
        ),
    );
  }
}
