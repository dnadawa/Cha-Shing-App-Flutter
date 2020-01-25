import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:cha_shing/widgets/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class AffiliateLogin extends StatelessWidget {


  _launchURL() async {
    const url = 'https://royaltybuildersllc.com/shop?olsPage=products%2Faffiliate-sign-up';
    if (await canLaunch(url)) {
      await launch(url,forceWebView: true,enableJavaScript: true,forceSafariVC: true);
    } else {
      throw 'Could not launch $url';
    }
  }


  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();

  TextEditingController timetocall = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Affiliate Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        elevation: 0,
        centerTitle: true,
      ),

      body: Center(
        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.bottomCenter,
                child: Image(image: AssetImage('images/shape.png'))),
            Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/logo_back.png')),//todo: add image
                //color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: double.infinity,height: 50,),
                    InputBox(hint: 'Name',type: TextInputType.text,controller: name,),
                    InputBox(hint: 'Email',type: TextInputType.emailAddress,controller: email,),
                    InputBox(hint: 'Phone',type: TextInputType.phone,controller: phone,),
                    InputBox(hint: 'Time to Call',type: TextInputType.text,controller: timetocall,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,20,30,20),
                      child: Button(color: Theme.of(context).accentColor,text: 'LOGIN',onclick: () async {


                        var sub = await Firestore.instance.collection('affiliate').where('email', isEqualTo: email.text).getDocuments();
                        var userlist = sub.documents;

                        if(userlist.isEmpty){
                          await Firestore.instance.collection('affiliate').add({
                            'name': name.text,
                            'email': email.text,
                            'phone': phone.text,
                            'time_to_call': timetocall.text
                          });

                          ToastBar(text: 'User Logged as Affiliate',color: Colors.green).show();
                          _launchURL();

                          name.clear();
                          email.clear();
                          phone.clear();
                          timetocall.clear();




                        }else{
                          ToastBar(text: 'You are already an Affiliate',color: Colors.red).show();
                        }


                      },),
                    ),
                   // Text('Login as referral',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
