import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:flutter/material.dart';



class Verify extends StatelessWidget {


  TextEditingController phone = TextEditingController();

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: double.infinity,height: 50,),
              Container(
                  height: 100,
                  child: Image(image: AssetImage('images/verification.png'))),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Text('Verify Your Number',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text('Please Enter Your Mobile Number to Recieve One Time Password',style: TextStyle(color: Colors.white,fontSize: 18),textAlign: TextAlign.center,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InputBox(hint: '+1',type: TextInputType.phone,controller: phone,),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,40,30,0),
                child: Button(color: Colors.white,textColor: Theme.of(context).accentColor,onclick: (){

                  },text: 'SEND OTP',),
              )
            ],
          ),
          ),
      ),
    );
  }
}
