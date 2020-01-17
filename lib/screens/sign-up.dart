import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:flutter/material.dart';




class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30),
            child: Container(width: double.infinity,height: double.infinity,color: Colors.white,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InputBox(hint: 'Name',type: TextInputType.text,),
                    InputBox(hint: 'Email',type: TextInputType.emailAddress,),
                    InputBox(hint: 'Password',isPassword: true,),
                    InputBox(hint: 'Confirm Password',isPassword: true,),
                    InputBox(hint: 'Mobile Number',type: TextInputType.phone,),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Button(color: Colors.white,text: 'SIGN UP',textColor: Colors.black,onclick: (){},),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(50,20,50,0),
                      child: GestureDetector(
                          onTap: (){Navigator.pop(context);},
                          child: Text('Sign In',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
