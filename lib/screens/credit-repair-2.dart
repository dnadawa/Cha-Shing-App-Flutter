import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:flutter/material.dart';


class CreditRepair2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Credit Repair',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 0,

      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text('Login',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18)),
            ),
            InputBox(hint: 'User ID',type: TextInputType.text,),
            InputBox(hint: 'Password',isPassword: true,),
            Padding(
              padding: const EdgeInsets.fromLTRB(40,50,40,0),
              child: Button(text: 'Submit',textColor: Colors.black,color: Theme.of(context).accentColor,onclick: (){},),
            )
          ],
        ),
      ),
    );
  }
}
