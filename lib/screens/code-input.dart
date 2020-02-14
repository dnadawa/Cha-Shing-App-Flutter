import 'package:cha_shing/screens/home.dart';
import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  _testSignInWithPhoneNumber(String smsCode, BuildContext context) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verId,
        smsCode: smsCode,
      );
      final AuthResult user = await _auth.signInWithCredential(credential);
      // final FirebaseUser currentUser = await _auth.currentUser();
      print('test 0');
      // print(credential);
      print('test 1');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', email);
      print('test 1.1');
      var sub = await Firestore.instance
          .collection('regular_login')
          .where('email', isEqualTo: email)
          .getDocuments();
      print('test 1.2');
      var userN = sub.documents;
      print('test 2');
      prefs.setString('name', userN[0].data['name']);
      print('test 3');
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => HomePage()),
      );

      print("User Logged In");
    } catch (E) {
      ToastBar(text: 'OTP is incorrect!', color: Colors.red).show();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', email);

      //I have connected my physical device let me run
      // i didn't worked all day half of my day i used to test projects :D
      // maybe there is some code that isn't letting it reach Navigator.pushReplacement method :D
      //if user sign in with email & password, you are trying to login with phone again why ?
      //my client want to add otp function, is it possible to use 2 sign in at same device ? 
      //yes it working well on android. the problem here is we are redirecting to capcha that's why otp get timeout
      // nah when you click first time it doesn't say code is expired you should read error
      //what does it said,? i don't remember man i was playing video game on phone :D
      //okay after build let's see ok ;)
      //my system is making noise
      //let me restart
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
              SizedBox(
                width: double.infinity,
                height: 50,
              ),
              Container(
                  height: 100,
                  child: Image(image: AssetImage('images/verification.png'))),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Verification Code',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'OTP has been sent to your mobile number. Please verify.',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 25),
                child: PinInputTextField(
                  decoration: BoxLooseDecoration(
                    strokeColor: Colors.white,
                    enteredColor: Colors.green.shade900,
                    radius: Radius.zero,
                    strokeWidth: 2,
                  ),
                  controller: code,
                  pinLength: 6,
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'If you didn\'t recive the code, Resend',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: Button(
                  color: Colors.white,
                  textColor: Theme.of(context).accentColor,
                  onclick: () => _testSignInWithPhoneNumber(code.text, context),
                  text: 'VERIFY',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
