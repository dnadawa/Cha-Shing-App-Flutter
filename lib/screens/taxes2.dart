import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:cha_shing/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';


class Taxes2 extends StatefulWidget {

  @override
  _Taxes2State createState() => _Taxes2State();
}

class _Taxes2State extends State<Taxes2> {

  AudioCache _audioCache;
  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController time = TextEditingController();

  TextEditingController refferd = TextEditingController();

  @override
  void initState() {
    super.initState();
    // create this only once
    _audioCache = AudioCache(fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
  }

  sendMail() async {
    await _audioCache.play('sound.mp3');
    String username = 'chashing47@gmail.com';
    String password = 'Dulaj@123';

    String _name = name.text;
    String _email = email.text;
    String _phone = phone.text;
    String _time = time.text;
    String _refferd = refferd.text;

    final smtpServer = gmail(username, password);
    // Create our message.
    final message = Message()
      ..from = Address(username, 'Cha Shing')
      ..recipients.add('solutions@taxqueenservice.com')
    //..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
    //..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Taxes (Reffaral)'
      ..text = 'Name:\t $_name\n'
          'Email:\t $_email\n'
          'Phone:\t $_phone\n'
          'Time:\t $_time\n'
          'Who Refferd?:\t $_refferd';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      ToastBar(text: 'Data Sent',color: Colors.green).show();
      name.clear();email.clear();phone.clear();time.clear();refferd.clear();
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text('Submit Referral Information ',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18),textAlign: TextAlign.center,),
                ),
                InputBox(hint: 'Name',type: TextInputType.text,controller: name,),
                InputBox(hint: 'Email',type: TextInputType.emailAddress,controller: email,),
                InputBox(hint: 'Phone Number',type: TextInputType.phone,controller: phone,),
                InputBox(hint: 'Time to Call',type: TextInputType.datetime,controller: time,),
                InputBox(hint: 'Who Refferd?',type: TextInputType.text,controller: refferd,),

                Padding(
                  padding: const EdgeInsets.fromLTRB(40,10,40,30),
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
