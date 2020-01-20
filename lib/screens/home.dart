import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:cha_shing/widgets/tile.dart';
import 'package:flutter/material.dart';



class HomePage extends StatelessWidget {


  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              Container(color: Theme.of(context).primaryColor,height: 300,),
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

      body: Center(
        child: Container(
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                 Container(color: Colors.white,width: 200,height: 100,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
