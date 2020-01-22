import 'package:cha_shing/screens/home.dart';
import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';


class VerificationCodeInput extends StatelessWidget {


  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController code = TextEditingController();
  final String verId;
  final String email;

   VerificationCodeInput({Key key, this.verId, this.email}) : super(key: key);

   _testSignInWithPhoneNumber(String smsCode,BuildContext context) async {

    try{
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verId,
        smsCode: smsCode,
      );
      final AuthResult user = await _auth.signInWithCredential(credential);
     // final FirebaseUser currentUser = await _auth.currentUser();

      print(credential);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', email);


      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => HomePage()),
      );

      print("User Logged In");
    }catch(E){
      ToastBar(text: 'OTP is incorrect!',color: Colors.red).show();
      print(E);
    }
  }

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
                  strokeWidth: 2,


                ),
                  controller: code,
                  pinLength: 6,),
              ),
              GestureDetector(
                  onTap: (){Navigator.pop(context);},
                  child: Text('If you didn\'t recive the code, Resend',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,20,30,0),
                child: Button(color: Colors.white,textColor: Theme.of(context).accentColor,onclick: ()=>_testSignInWithPhoneNumber(code.text,context),text: 'VERIFY',),
              )
            ],
          ),
        ),
      ),
    );
  }
}
