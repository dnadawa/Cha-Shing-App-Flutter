import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:flutter/material.dart';


class Taxes2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Taxes',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 0,

      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text('Submit Referral Information ',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18),textAlign: TextAlign.center,),
                ),
                InputBox(hint: 'Name',type: TextInputType.text,),
                InputBox(hint: 'Email',type: TextInputType.emailAddress,),
                InputBox(hint: 'Phone Number',type: TextInputType.phone,),
                InputBox(hint: 'Time to Call',type: TextInputType.datetime,),
                InputBox(hint: 'Who Refferd?',type: TextInputType.text,),

                Padding(
                  padding: const EdgeInsets.fromLTRB(40,10,40,30),
                  child: Button(text: 'Submit',textColor: Colors.black,color: Theme.of(context).accentColor,onclick: (){},),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
