import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:flutter/material.dart';


class CreditRepair1 extends StatelessWidget {
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

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text('Fill out this form for free consultation',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18),textAlign: TextAlign.center,),
              ),
              InputBox(hint: 'Full Name',type: TextInputType.text,),
              InputBox(hint: 'Email',type: TextInputType.emailAddress,),
              InputBox(hint: 'Suffix (Jr. Sr. etc)',type: TextInputType.text,),
              InputBox(hint: 'Phone (Home)',type: TextInputType.phone,),
              InputBox(hint: 'Phone (Mobile)',type: TextInputType.phone,),
              Padding(
                padding: const EdgeInsets.fromLTRB(40,100,40,0),
                child: Button(text: 'Submit',textColor: Colors.black,color: Theme.of(context).accentColor,onclick: (){},),
              )
            ],
          ),
        ),
      ),
    );
  }
}