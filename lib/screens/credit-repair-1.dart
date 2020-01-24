
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:cha_shing/widgets/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class CreditRepair1 extends StatefulWidget {

  @override
  _CreditRepair1State createState() => _CreditRepair1State();
}

class _CreditRepair1State extends State<CreditRepair1> {
  AudioCache _audioCache;

  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController suffix = TextEditingController();

  TextEditingController phone_home = TextEditingController();

  TextEditingController phone_mobile = TextEditingController();

  @override
  void initState() {
    super.initState();
    // create this only once
    _audioCache = AudioCache(fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Credit Repair',style: TextStyle(fontWeight: FontWeight.bold),),
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
                  child: Text('Fill out this form for free consultation',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18),textAlign: TextAlign.center,),
                ),
                InputBox(hint: 'Full Name',type: TextInputType.text,controller: name,),
                InputBox(hint: 'Email',type: TextInputType.emailAddress,controller: email,),
                InputBox(hint: 'Suffix (Jr. Sr. etc)',type: TextInputType.text,controller: suffix,),
                InputBox(hint: 'Phone (Home)',type: TextInputType.phone,controller: phone_home,),
                InputBox(hint: 'Phone (Mobile)',type: TextInputType.phone,controller: phone_mobile,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40,100,40,0),
                  child: Button(text: 'Submit',textColor: Colors.black,color: Theme.of(context).accentColor,onclick: () async {


                    await _audioCache.play('sound.mp3');
                    try{
                      await Firestore.instance.collection('credit_repair').add({
                        'name': name.text,
                        'email': email.text,
                        'suffix': suffix.text,
                        'phone_home': phone_home.text,
                        'phone_mobile': phone_mobile.text
                      });

                      ToastBar(text: 'Data Send Successfully!',color: Colors.green).show();
                      name.clear();
                      email.clear();
                      suffix.clear();
                      phone_home.clear();
                      phone_mobile.clear();

                    }
                    catch(E){
                      ToastBar(text: 'Something Went Wrong',color: Colors.red).show();

                    }



                  },),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
