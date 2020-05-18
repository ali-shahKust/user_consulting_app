import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designsaeed/constants.dart';
import 'package:designsaeed/homepage/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'login.dart';
class SignUpClass extends StatefulWidget {
  @override
  _SignUpClassState createState() => _SignUpClassState();
}

class _SignUpClassState extends State<SignUpClass> {
  String _email, _password,_name;
  final databaseReference = Firestore.instance;
  ProgressDialog pr;
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _namecontroller = TextEditingController();
  final _surcontroller = TextEditingController();
  final _phonecontroller = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);
    ResponsiveWidgets.init(context,
      height: 1920, // Optional
      width: 1080, // Optional
      allowFontScaling: true, // Optional
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Stack(
              children: <Widget>[
                ResponsiveContainer(
                  heightPercent: 30.0,
                  widthPercent: 100.0,
                  child: Container(
                    child: Image.asset('assets/background.png',
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsetsResponsive.only(top:200.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text("SIGN UP",style: TextStyle(
                        color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Gotham',
                      fontSize: 20.0,
                      letterSpacing: 1.0
                    ),),
                  ),
                ),
              ],
            ),

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Material(
            elevation: 2.0,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: TextField(

              keyboardType: TextInputType.text,
              controller: _namecontroller,
              onChanged: (String value) {},
              decoration: InputDecoration(
                  hintText: "Name",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child:FaIcon(FontAwesomeIcons.user,size: 18.0,),
                  ),
                  border: InputBorder.none,
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
            ),
          ),
        ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: TextField(

                  keyboardType: TextInputType.text,
                  controller: _surcontroller,
                  onChanged: (String value) {},
                  decoration: InputDecoration(
                      hintText: "SurName",
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child:FaIcon(FontAwesomeIcons.user,size: 18.0,),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: TextField(

                  keyboardType: TextInputType.phone,
                  controller: _phonecontroller,
                  onChanged: (String value) {},
                  decoration: InputDecoration(
                      hintText: "Phone Number",
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child:FaIcon(FontAwesomeIcons.phone,size: 18.0,),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: TextField(

                  keyboardType: TextInputType.emailAddress,
                  controller: _emailcontroller,
                  onChanged: (String value) {},
                  decoration: InputDecoration(
                      hintText: "Email",
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child:FaIcon(FontAwesomeIcons.envelope,size: 18.0,),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: TextField(
                  obscureText: true,
                  controller: _passwordcontroller,
                  onChanged: (String value) {},
                  decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child:FaIcon(FontAwesomeIcons.eyeSlash,size: 18.0,),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ResponsiveContainer(
                widthPercent: 100.0,
                heightPercent: 8.0,
                child: MaterialButton(

                  color:appColor,
                  child: Text('REGISTER',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                        letterSpacing: 1.0
                    ),),
                  elevation: 2,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  onPressed: (){
                    signUp();
                  },
                ),
              ),
            ),
            Text('Already have an account?',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Gotham',
              ),),
            ResponsiveContainer(
              widthPercent: 100,
              heightPercent: 9,
              child: MaterialButton(
                height: 45,
                minWidth: 360,
                color:appColor,
                child: Text('LOGIN',
                  style: TextStyle(
                    fontFamily: 'Gotham',
                    color: Colors.white,
                  ),),
                elevation: 2,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              ),
            ),
          ],

        ),
      ),
    );
  }
  //Function will called On sign up Button
  void signUp() async {
//getting Text From TextField
    _email = _emailcontroller.text;
    _password = _passwordcontroller.text;
    _name = _namecontroller.text;

    try{

      pr.style(
          message: 'Please Wait...',
          borderRadius: 10.0,
          backgroundColor: Colors.white,
          progressWidget: CircularProgressIndicator(),
          elevation: 10.0,
          insetAnimCurve: Curves.easeInOut,
          progress: 0.0,
          maxProgress: 100.0,
          progressTextStyle: TextStyle(
              color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
          messageTextStyle: TextStyle(
              color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
      );
      await pr.show();

      //Create user And check Validations
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);

      String mUid = (await FirebaseAuth.instance.currentUser()).uid;
      //Firestore
      await databaseReference.collection("Users")
          .document(mUid).setData({
        'username': _namecontroller.text,
        'email': _email,
        'password': _password,
        'phone_number': _phonecontroller.text,
        'user_uid': mUid,
        'surname': _surcontroller.text
      });
      pr.hide().then((isHidden) {
        print(isHidden);
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }catch(e){

      pr.hide().then((isHidden) {
        print(isHidden);
      });
      print(e.message);
    }

  }
}




