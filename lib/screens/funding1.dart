import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:flutter/material.dart';





class Funding1 extends StatefulWidget {
  @override
  _Funding1State createState() => _Funding1State();
}

class _Funding1State extends State<Funding1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Funding',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 0,

      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text('Select Funding Type',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18),textAlign: TextAlign.center,),
              ),
              Row(
                children: <Widget>[
                  Radio(value: 1, groupValue: 1, onChanged: (value){
                    print(value);
                  }),
                  Text('Personal',style: TextStyle(fontWeight: FontWeight.w900),)
                ],
              ),

              Row(
                children: <Widget>[
                  Radio(value: 1, groupValue: 1, onChanged: (value){
                    print(value);
                  }),
                  Text('Business',style: TextStyle(fontWeight: FontWeight.w900),)
                ],
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(40,100,40,0),
                child: Button(text: 'Submit',textColor: Colors.black,color: Theme.of(context).accentColor,onclick: (){},),
              )
            ],
          ),
        ),
      ),
    );
  }
}
