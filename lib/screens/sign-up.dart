import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:flutter/material.dart';




class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width/20;
    double y = MediaQuery.of(context).size.width/10;
    double z = MediaQuery.of(context).size.height/20;
    print(z);
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
            padding: EdgeInsets.fromLTRB(y,z,y,0),
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
