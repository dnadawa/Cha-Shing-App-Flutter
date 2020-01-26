import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:cha_shing/widgets/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class AffiliatePayment extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String timeToCall;

  const AffiliatePayment({Key key, this.name, this.email, this.phone, this.timeToCall}) : super(key: key);



  _launchURL() async {
    const url = 'https://royaltybuildersllc.com/shop?olsPage=products%2Faffiliate-sign-up';
    if (await canLaunch(url)) {
      await launch(url,forceWebView: true,enableJavaScript: true,forceSafariVC: true);
    } else {
      throw 'Could not launch $url';
    }
  }

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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10),
                     child: Text('This is a one-time subscription for cha ching app affiliation.  Get instant access to make more money by sending in referrals. ',
                     style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                   ),

                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Container(
                        height: 150,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Theme.of(context).accentColor,width: 5),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(child: Text('\$99.99',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 60),)),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,50),
                      child: Button(text: 'BUY',color: Theme.of(context).accentColor,textColor: Colors.white,onclick: () async {


                        var sub = await Firestore.instance.collection('affiliate').where('email', isEqualTo: email).getDocuments();
                        var userlist = sub.documents;

                        if(userlist.isEmpty){
                          await Firestore.instance.collection('affiliate').add({
                            'name': name,
                            'email': email,
                            'phone': phone,
                            'time_to_call': timeToCall});

                          _launchURL();
                          //ToastBar(text: 'User Logged as Affiliate',color: Colors.green).show();




                        }else{
                          ToastBar(text: 'You are already an Affiliate',color: Colors.red).show();
                        }






                      },),
                    )

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
