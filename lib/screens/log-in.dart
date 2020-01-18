import 'package:cha_shing/screens/sign-up.dart';
import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width/20;
    double y = MediaQuery.of(context).size.width/10;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: <Widget>[
          Padding(
            padding:  EdgeInsets.all(x),
            child: Center(child: Image(image: AssetImage('images/background.png'))),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: y),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InputBox(hint: 'Email',type: TextInputType.emailAddress,),
                InputBox(hint: 'Password',isPassword: true,),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Button(color: Theme.of(context).accentColor,text: 'LOGIN',onclick: (){},),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(40,15,40,0),
                  child: Button(color: Theme.of(context).accentColor,text: 'Create an Account', onclick: (){
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => SignUp()),
                    );

                  },),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
