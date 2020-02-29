import 'package:cha_shing/screens/home.dart';
import 'package:cha_shing/screens/sign-up.dart';
import 'package:cha_shing/screens/verify.dart';
import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:cha_shing/widgets/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';




class LogIn extends StatelessWidget {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;


  resetPassword() async {
    if(email.text!=''){
      try{
        await auth.sendPasswordResetEmail(email: email.text);
        ToastBar(text: 'Password reset link is sent to your email!',color: Colors.green).show();
      }
      catch(E){
        ToastBar(text: 'Something went Wrong!',color: Colors.red).show();
      }

    }
    else{
      ToastBar(text: 'Please enter your email address!',color: Colors.red).show();
    }

  }

 signIn(String email, String password,BuildContext context) async {

   try{
     AuthResult result = await auth.signInWithEmailAndPassword(
         email: email, password: password);
     FirebaseUser user = result.user;
     print(user.uid);


     SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString('email', email);
     var sub = await Firestore.instance
         .collection('regular_login')
         .where('email', isEqualTo: email)
         .getDocuments();
     var userN = sub.documents;
     prefs.setString('name', userN[0].data['name']);

     Navigator.pushReplacement(
       context,
       CupertinoPageRoute(builder: (context) => HomePage()),
     );
   }
   catch(E){
    ToastBar(color: Colors.red,text: 'Something went Wrong').show();
   }

  }
  



  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width/30;
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
                InputBox(hint: 'Email',type: TextInputType.emailAddress,controller: email,),
                InputBox(hint: 'Password',isPassword: true,controller: password,),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Button(color: Theme.of(context).accentColor,text: 'LOGIN',onclick: ()=>signIn(email.text, password.text,context),),
                ),



                Padding(
                  padding: const EdgeInsets.fromLTRB(40,15,40,0),
                  child: Button(color: Theme.of(context).accentColor,text: 'Create an Account', onclick: (){
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => SignUp()),
                    );

                  },),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                      onTap: ()=>resetPassword(),
                      child: Text('Forgot Password',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
