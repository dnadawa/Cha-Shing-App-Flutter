import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:flutter/material.dart';


class FundingPersonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Funding',style: TextStyle(fontWeight: FontWeight.bold),),
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
                child: Text('Fill In Information For Your Personal Fund',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18),textAlign: TextAlign.center,),
              ),
              InputBox(hint: 'Name',type: TextInputType.text,),
              InputBox(hint: 'Email',type: TextInputType.emailAddress,),
              InputBox(hint: 'Phone Number',type: TextInputType.phone,),
              InputBox(hint: 'Time to Call',type: TextInputType.datetime,),
              InputBox(hint: 'Amount',type: TextInputType.number,),
              InputBox(hint: 'Credit Score',type: TextInputType.number,),
              DropdownButton<String>(
                items: <String>['A', 'B', 'C', 'D'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                hint: Text('Type of Loan'),
                onChanged: (_) {},
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40,30,40,0),
                child: Button(text: 'Submit',textColor: Colors.black,color: Theme.of(context).accentColor,onclick: (){},),
              )
            ],
          ),
        ),
      ),
    );
  }
}
