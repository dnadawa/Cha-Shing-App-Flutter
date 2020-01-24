import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:flutter/material.dart';



class ReffaralLogin extends StatelessWidget {


  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Reffaral Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        elevation: 0,
        centerTitle: true,
      ),

      body: Center(
        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.bottomCenter,
                child: Image(image: AssetImage('images/shape.png'))),
            Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/logo_back.png')),//todo: add image
                //color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: double.infinity,height: 50,),
                    InputBox(hint: 'Name',type: TextInputType.text,),
                    InputBox(hint: 'Email',type: TextInputType.emailAddress,),
                    InputBox(hint: 'Phone',type: TextInputType.phone,),
                    InputBox(hint: 'Time to Call',type: TextInputType.text,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,20,30,20),
                      child: Button(color: Theme.of(context).accentColor,text: 'LOGIN',onclick: (){},),
                    ),
                    Text('Login as referral',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
