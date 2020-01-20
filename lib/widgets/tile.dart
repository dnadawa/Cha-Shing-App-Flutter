import 'package:flutter/material.dart';

class Tile extends StatelessWidget {

  final String text;
  final Function onclick;

  const Tile({Key key, this.text, this.onclick}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(40, 30, 20, 0),
        child: GestureDetector(
          onTap: onclick,
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
