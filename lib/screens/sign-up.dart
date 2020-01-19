import 'package:cha_shing/widgets/button.dart';
import 'package:cha_shing/widgets/textbox.dart';
import 'package:cha_shing/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';




class SignUp extends StatelessWidget {


  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController com_password = TextEditingController();
  TextEditingController passwordf = TextEditingController();

final CollectionReference collectionReference = Firestore.instance.collection("users");


   signUp(String emailAddress, String password) async {

     if(com_password.text==passwordf.text){

       if(emailAddress!=''&&name.text!=''&&phone.text!=''&&password!=''&&com_password!=''){
         try{
           AuthResult result = await auth.createUserWithEmailAndPassword(
               email: emailAddress, password: password);
           FirebaseUser user = result.user;
           print(user.email);

           await collectionReference.document(user.uid).setData({
             'name': name.text,
             'email': emailAddress,
             'mobile': phone.text
           });

           name.clear();
           passwordf.clear();
           com_password.clear();
           phone.clear();
           email.clear();

           ToastBar(color: Colors.green,text: 'Signed Up Successfully!').show();
         }
         catch(E){
           print(E);
           ToastBar(color: Colors.red,text: 'Something Went Wrong!'+E.toString()).show();
         }
       }
       else{
         ToastBar(color: Colors.red,text: 'Please Fill all the Fields!').show();
       }

     }
     else{
       ToastBar(color: Colors.red,text: 'Passwords did not match!').show();
     }



  }



  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width/20;
    double y = MediaQuery.of(context).size.width/10;
    double z = MediaQuery.of(context).size.height/20;
    print(z);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: <Widget>[
          Padding(
            padding:  EdgeInsets.all(x),
            child: Center(child: Image(image: AssetImage('images/background.png'))),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(y,z,y,0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InputBox(hint: 'Name',type: TextInputType.text,controller: name,),
                    InputBox(hint: 'Email',type: TextInputType.emailAddress,controller: email,),
                    InputBox(hint: 'Password',isPassword: true,controller: passwordf,),
                    InputBox(hint: 'Confirm Password',isPassword: true,controller: com_password,),
                    InputBox(hint: 'Mobile Number',type: TextInputType.phone,controller: phone,),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Button(color: Colors.white,text: 'SIGN UP',textColor: Colors.black,onclick: ()=>signUp(email.text, passwordf.text),),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(50,20,50,0),
                      child: GestureDetector(
                          onTap: (){Navigator.pop(context);},
                          child: Text('Sign In',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
