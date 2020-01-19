import 'package:cha_shing/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';


class VerificationCodeInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),

      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/verify_back.png')),
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
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text('Verification Code',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text('OTP has been sent to your mobile number. Please verify.',style: TextStyle(color: Colors.white,fontSize: 18),textAlign: TextAlign.center,),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,20,20,25),
                child: PinInputTextField(decoration: BoxLooseDecoration(
                    strokeColor: Colors.white,
                    enteredColor: Colors.green.shade900,
                  radius: Radius.zero,
                  strokeWidth: 2


                ),
                  pinLength: 6,),
              ),
              Text('If you didn\'t recive the code, Resend',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,20,30,0),
                child: Button(color: Colors.white,textColor: Theme.of(context).accentColor,onclick: (){},text: 'VERIFY',),
              )
            ],
          ),
        ),
      ),
    );
  }
}
