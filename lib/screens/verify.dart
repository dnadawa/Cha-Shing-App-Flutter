import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:flutter/material.dart';


class Verify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        elevation: 0,
        centerTitle: true,
      ),

      body: Center(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('images/verify_back.png')),//todo: add image
              //color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage('images/verification.png')),
              Text('Verify Your Number',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
              Text('Please Enter Your Mobile Number to Recieve One Time Password',style: TextStyle(color: Colors.white,fontSize: 18),textAlign: TextAlign.center,),
              InputBox(hint: '+1',type: TextInputType.phone,),
              Button(color: Colors.white,textColor: Theme.of(context).accentColor,onclick: (){},text: 'SEND OTP',)
            ],
          ),
          ),
      ),
    );
  }
}
