import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final onclick;
  final String text;
  final Color color;
  final Color textColor;


  const Button({Key key, this.onclick, this.text, this.color: Colors.black, this.textColor=Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        onPressed: onclick,

        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: color,
        textColor: textColor,
        padding: EdgeInsets.all(15),
        child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
      ),
    );
  }
}