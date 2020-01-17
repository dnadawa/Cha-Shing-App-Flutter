import 'package:flutter/material.dart';


class InputBox extends StatefulWidget {

  final String hint;
  final TextInputType type;
  final TextEditingController controller;
  final bool isPassword;


  const InputBox({Key key, this.hint, this.type, this.controller, this.isPassword=false}) : super(key: key);

  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {

  bool x = true;

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        keyboardType: widget.type,
        obscureText: widget.isPassword&&x,
        controller: widget.controller,
        textAlignVertical: TextAlignVertical.center,

        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: BorderSide(color: Colors.black,width: 0)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: BorderSide(color: Colors.black,width: 0)),
            fillColor: Colors.grey.shade200,
            hintText: widget.hint,
            suffixIcon: widget.isPassword?IconButton(icon: Icon(Icons.visibility_off,color: Colors.grey,),onPressed: (){


              setState(() {
                x = !x;
                print(x);
              });





              },):null,
            //suffix: isPassword?Icon(Icons.visibility_off):null,
            hintStyle: TextStyle(color: Colors.grey.shade800),
            filled: true,
            focusColor: Colors.grey
        ),
      ),
    );
  }
}
