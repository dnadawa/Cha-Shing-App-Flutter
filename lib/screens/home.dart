import 'package:cha_shing/screens/account-type.dart';
import 'package:cha_shing/screens/affiliate-login.dart';
import 'package:cha_shing/screens/credit-repair-1.dart';
import 'package:cha_shing/screens/funding1.dart';
import 'package:cha_shing/screens/log-in.dart';
import 'package:cha_shing/screens/sign-up.dart';
import 'package:cha_shing/screens/taxes1.dart';
import 'package:cha_shing/screens/taxes2.dart';
import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:cha_shing/widgets/tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';



class HomePage extends StatefulWidget {



  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  _launchURL() async {
    const url = 'https://www.messenger.com/login.php?next=https%3A%2F%2Fwww.messenger.com%2Ft%2F104862861048695%2F%3Fmessaging_source%3Dsource%253Apages%253Amessage_shortlink';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  TextEditingController phone = TextEditingController();

   String type;

  getUserExists() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email');
    CollectionReference x = Firestore.instance.collection('affiliate');
    var sub = await x.where('email',isEqualTo: email).getDocuments();
    var userlist = sub.documents;
    if(userlist.isNotEmpty){
      type = 'affiliate';
    }else{
      type = 'normal';
    }
  }

  String name='World!';

  @override
  void initState() {
    // TODO: implement initState
    getUserExists();
    getName();
  }

  getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
    print(name);
  }



  @override
  Widget build(BuildContext context) {
    double a = MediaQuery.of(context).size.width/2.6;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Home',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        elevation: 0,
        centerTitle: true,
      ),

      drawer: Drawer(
        child: Column(
          children: <Widget>[
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  image: DecorationImage(image: AssetImage('images/drawer.png'))
                ),
              ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Tile(text: 'Home',page: HomePage(),),
                Tile(text: 'Account Type',page: AccountType(),),
                Tile(text: 'Setup Profile',page: SignUp(),),
                Tile(text: 'Become Affiliate',page: AffiliateLogin(),),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 30, 20, 0),
                  child: GestureDetector(
                    onTap: ()=>_launchURL(),
                    child: Text(
                      'Questions',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 30, 20, 0),
                  child: GestureDetector(
                    onTap: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString('email', null);
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => LogIn()),
                      );
                    },
                    child: Text(
                      'LogOut',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ],
            )

          ],
        ),
      ),

      body: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Hello $name',style: GoogleFonts.notoSansJP(
                  textStyle: TextStyle(fontWeight: FontWeight.w900,fontSize: 25),
                ),),
              )),
          Align(
              alignment: Alignment.bottomCenter,
              child: Image(image: AssetImage('images/shape.png'))),
          Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.fromLTRB(20,40,20,20),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('images/verify_back.png')),//todo: add image
              //color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[

                          Text(
                            'Credit Repair',
                            style: GoogleFonts.notoSansJP(
                              textStyle: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                CupertinoPageRoute(builder: (context) => CreditRepair1()),
                              );
                            },
                            child: Container(
                              width: a,
                              height: 100,
                              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/credit_repair.png'))),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            'Taxes',
                            style: GoogleFonts.notoSansJP(
                              textStyle: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                CupertinoPageRoute(builder: (context) => type=='affiliate'?Taxes1():Taxes2()),
                              );
                            },
                            child: Container(
                              width: a,
                              height: 100,
                              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/tax.png'))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Column(
                    children: <Widget>[
                      Text(
                        'Funding',
                        style: GoogleFonts.notoSansJP(
                          textStyle: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Funding1()),
                          );
                        },
                        child: Container(
                          width: a,
                          height: 100,
                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/funding.png'))),
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
