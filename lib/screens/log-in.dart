import 'package:cha_shing/screens/sign-up.dart';
import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30),
            child: Container(width: double.infinity,height: double.infinity,color: Colors.white,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  padding: const EdgeInsets.fromLTRB(50,15,50,0),
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
