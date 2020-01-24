import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:cha_shing/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';


class FundingBusiness extends StatelessWidget {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController timetocall = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController creditscore = TextEditingController();
  TextEditingController typeOfLoan = TextEditingController();

  sendMail() async {
    String username = 'chashing47@gmail.com';
    String password = 'Dulaj@123';

    String _name = name.text;
    String _email = email.text;
    String _phone = phone.text;
    String _time = timetocall.text;
    String _amount = amount.text;
    String _credit = creditscore.text;
    String _type = typeOfLoan.text;

    final smtpServer = gmail(username, password);
    // Create our message.
    final message = Message()
      ..from = Address(username, 'Cha Shing')
      ..recipients.add('info@royaltyfunding.com')
    //..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
    //..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Funding (Business) Data'
      ..text = 'Name:\t $_name\n'
          'Email:\t $_email\n'
          'Phone:\t $_phone\n'
          'Time:\t $_time\n'
          'Amount:\t $_amount\n'
          'Credit:\t $_credit\n'
          'Type of Loan:\t$_type';

    try {
      final sendReport = await send(message, smtpServer);
      ToastBar(text: 'Data Sent',color: Colors.green).show();
      name.clear();email.clear();phone.clear();timetocall.clear();
      amount.clear();creditscore.clear();typeOfLoan.clear();
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      ToastBar(text: 'Data Not Sent',color: Colors.red).show();
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Funding',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 0,

      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text('Fill In Information For Your Business Fund',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18),textAlign: TextAlign.center,),
                ),
                InputBox(hint: 'Name',type: TextInputType.text,controller: name,),
                InputBox(hint: 'Email',type: TextInputType.emailAddress,controller: email,),
                InputBox(hint: 'Phone Number',type: TextInputType.phone,controller: phone,),
                InputBox(hint: 'Time to Call',type: TextInputType.datetime,controller: timetocall,),
                InputBox(hint: 'Amount',type: TextInputType.number,controller: amount,),
                InputBox(hint: 'Credit Score',type: TextInputType.number,controller: creditscore,),
                InputBox(hint: 'Type of Loan',type: TextInputType.text,controller: typeOfLoan,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40,30,40,0),
                  child: Button(text: 'Submit',textColor: Colors.black,color: Theme.of(context).accentColor,onclick: ()=>sendMail(),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
