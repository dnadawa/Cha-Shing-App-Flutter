import 'package:cha_shing/screens/affiliate-login.dart';
import 'package:cha_shing/screens/funding-business.dart';
import 'package:cha_shing/screens/funding-personal.dart';
import 'package:cha_shing/screens/log-in.dart';
import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





class AccountType extends StatefulWidget {
  @override
  _AccountTypeState createState() => _AccountTypeState();
}

class _AccountTypeState extends State<AccountType> {

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
    selectedRadio = 'affiliate';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Account Type',style: TextStyle(fontWeight: FontWeight.bold),),
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
                child: Text('Select Account Type',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18),textAlign: TextAlign.center,),
              ),
              Row(
                children: <Widget>[
                  Radio(value: 'affiliate', groupValue: selectedRadio, onChanged: (value){
                    setSelectedRadio(value);
                  }),
                  Text('Affiliate',style: TextStyle(fontWeight: FontWeight.w900),)
                ],
              ),

              Row(
                children: <Widget>[
                  Radio(value: 'regular', groupValue: selectedRadio, onChanged: (value){
                    setSelectedRadio(value);
                  }),
                  Text('Regular',style: TextStyle(fontWeight: FontWeight.w900),)
                ],
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(40,100,40,0),
                child: Button(text: 'Submit',textColor: Colors.black,color: Theme.of(context).accentColor,onclick: (){

                  if(selectedRadio=='affiliate'){
                    print('affiliate selected');
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => AffiliateLogin()),
                    );

                  }
                  else{
                    print('regular selected');
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => LogIn()),
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
