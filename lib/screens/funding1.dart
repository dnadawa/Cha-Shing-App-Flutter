import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cha_shing/screens/funding-business.dart';
import 'package:cha_shing/screens/funding-personal.dart';
import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





class Funding1 extends StatefulWidget {
  @override
  _Funding1State createState() => _Funding1State();
}

class _Funding1State extends State<Funding1> {

  AudioCache _audioCache;

String selectedRadio;
  setSelectedRadio(String val) {
    setState(() {
      selectedRadio = val;
      //print(selectedRadio);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadio = 'personal';
    _audioCache = AudioCache(fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
  }


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
                child: Text('Select Funding Type',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18),textAlign: TextAlign.center,),
              ),
              Row(
                children: <Widget>[
                  Radio(value: 'personal', groupValue: selectedRadio, onChanged: (value){
                    setSelectedRadio(value);
                  }),
                  Text('Personal',style: TextStyle(fontWeight: FontWeight.w900),)
                ],
              ),

              Row(
                children: <Widget>[
                  Radio(value: 'business', groupValue: selectedRadio, onChanged: (value){
                    setSelectedRadio(value);
                  }),
                  Text('Business',style: TextStyle(fontWeight: FontWeight.w900),)
                ],
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(40,100,40,0),
                child: Button(text: 'Submit',textColor: Colors.black,color: Theme.of(context).accentColor,onclick: () async {

                  await _audioCache.play('sound.mp3');
                  if(selectedRadio=='personal'){
                    print('persoal selected');
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => FundingPersonal()),
                    );

                  }
                  else{
                    print('business selected');
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => FundingBusiness()),
                    );
                  }



                },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
