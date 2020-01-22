import 'package:cha_shing/screens/credit-repair-1.dart';
import 'package:cha_shing/screens/funding1.dart';
import 'package:cha_shing/screens/taxes1.dart';
import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:cha_shing/widgets/tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class HomePage extends StatelessWidget {


  TextEditingController phone = TextEditingController();

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
                Tile(text: 'Home',),
                Tile(text: 'Account Type',),
                Tile(text: 'Setup Profile',),
                Tile(text: 'Become Affiliate',),
                Tile(text: 'Questions',),
                Tile(text: 'Logout',),
              ],
            )

          ],
        ),
      ),

      body: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.bottomCenter,
              child: Image(image: AssetImage('images/shape.png'))),
          Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.all(20),
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
                                CupertinoPageRoute(builder: (context) => Taxes1()),
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
