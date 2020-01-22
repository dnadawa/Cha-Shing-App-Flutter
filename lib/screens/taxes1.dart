import 'dart:io';

import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:cha_shing/widgets/toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';


class Taxes1 extends StatefulWidget {

  @override
  _Taxes1State createState() => _Taxes1State();
}

class _Taxes1State extends State<Taxes1> {
  File file;


  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add your comment'),
            content: InputBox(hint: 'Comment',type: TextInputType.text,controller: com,),
            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL',style: TextStyle(color: Theme.of(context).accentColor),),
                onPressed: () {
                  com.clear();
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text('OK',style: TextStyle(color: Theme.of(context).accentColor)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  bool upload=false;

  bool comment=false;

  TextEditingController name = TextEditingController();

  TextEditingController com = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController filling = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController url = TextEditingController();


  sendMail() async {
    String username = 'chashing47@gmail.com';
    String password = 'Dulaj@123';

    String _name = name.text;
    String _email = email.text;
    String _phone = phone.text;
    String _filling = filling.text;
    String _comment = com.text;
    String _url = url.text;

    final smtpServer = gmail(username, password);
    // Create our message.
    final message = Message()
      ..from = Address(username, 'Cha Shing')
      ..recipients.add('dulajnadawa@gmail.com')
      ..subject = 'Taxes (Reffaral)'
      ..attachments.add(FileAttachment(file))
      ..text = 'Name:\t $_name\n'
          'Email:\t $_email\n'
          'Filling Status:\t $_filling\n'
          'Phone:\t $_phone\n'
          'URL Link:\t $_url\n'
          'Comment:\t $_comment';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      ToastBar(text: 'Data Sent',color: Colors.green).show();
      name.clear();email.clear();phone.clear();url.clear();com.clear();
      filling.clear();
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
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text('Submit Affliate Information ',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18),textAlign: TextAlign.center,),
                ),
                InputBox(hint: 'Name',type: TextInputType.text,controller: name,),
                InputBox(hint: 'Email',type: TextInputType.emailAddress,controller: email,),
                InputBox(hint: 'Filing Status',type: TextInputType.text,controller: filling,),
                InputBox(hint: 'Phone Number',type: TextInputType.phone,controller: phone,),
                InputBox(hint: 'URL Link',type: TextInputType.url,controller: url,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text('To upload any box form, upload from here:',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40,10,40,0),
                  child: Button(text: 'Submit Form',textColor: Colors.black,color: Theme.of(context).accentColor,onclick: () async {
                    file = await FilePicker.getFile();
                    setState(() {
                      upload=true;
                    });
                  },),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40,10,40,0),
                  child: Button(text: 'Comment',textColor: Colors.black,color: Theme.of(context).accentColor,onclick: () async {
                    await _displayDialog(context);
                    setState(() {
                      comment=true;
                    });
                  },),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(40,10,40,30),
                  child: Button(text: 'Submit',textColor: Colors.black,color: Theme.of(context).accentColor,onclick: upload&&comment?(){sendMail();}:null,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
