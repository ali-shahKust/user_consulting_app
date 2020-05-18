import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designsaeed/constants.dart';
import 'package:designsaeed/homepage/HomePage.dart';
import 'package:designsaeed/resetpassword.dart';
import 'package:designsaeed/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'homepage/BottomNavBar.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String _email, _password,_name;
  final databaseReference = Firestore.instance;
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  ProgressDialog pr;

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
          children: <Widget>[
            ResponsiveContainer(
              widthPercent: 100.0,
              heightPercent: 30.0,
              child: Container(
                  child: Image.asset('assets/background.png',
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fill,
                  )),
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
                heightPercent: 8.0,
                widthPercent: 100.0,
                child: RaisedButton(
                  color:appColor,
                  child: Text('LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                    ),),
                  elevation: 2,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  onPressed: (){
                    signIn();
                  },
                ),
              ),
            ),

//            Padding(
//              padding: const EdgeInsets.all(10.0),
//              child: Align(
//                alignment: Alignment.topRight,
//                child: InkWell(
//                  onTap: (){
//                  },
//                  child:  Text('Forgot password?',
//                    style: TextStyle(
//                      color: Colors.blue,
//                      fontFamily: 'Gotham',
//                    ),),
//                ),
//              ),
//            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Dash(
                      direction: Axis.horizontal,
                      length: 100,
                      dashLength: 8,
                      dashColor: Colors.grey),
                  Text('Login with'),
                  Dash(
                      direction: Axis.horizontal,
                      length: 100,
                      dashLength: 8,
                      dashColor: Colors.grey),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ResponsiveContainer(
                heightPercent: 8.0,
                widthPercent: 100.0,
                child: RaisedButton(
                  elevation: 2,
                    shape:  RoundedRectangleBorder(
                        borderRadius:  BorderRadius.circular(30.0)),
                    onPressed: () {
                    },
                    child:  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                            Image.asset(
                            'assets/facebook.png',
                          ),
                          Padding(
                            padding:  EdgeInsetsResponsive.only(left: 250.0),
                            child: Text(
                              "Facebook",
                              style: TextStyle(
                                  fontFamily: 'Gotham',
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                   color: Color(0xFF293C9A),
                    textColor: Color(0xFFFFFFFF),

                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ResponsiveContainer(
                heightPercent: 8.0,
                widthPercent: 100.0,
                child: RaisedButton(
                  elevation: 2,
                  shape:  RoundedRectangleBorder(
                      borderRadius:  BorderRadius.circular(30.0)),
                  onPressed: () {
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Row(
                      children: <Widget>[
                        new Image.asset(
                          'assets/google.png',
                        ),
                         Padding(
                           padding:  EdgeInsetsResponsive.only(left: 250.0),
                           child: Text(
                            "Google",
                            style: TextStyle(
                                fontFamily: 'Gotham',
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                         )
                      ],
                    ),
                  ),
                  color: Color(0xFFFFFFFF),

                  textColor: Colors.black,

                ),
              ),
            ),

            Text('Dont have an account?',
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
               child: Text('SIGNUP',
                 style: TextStyle(
                   fontFamily: 'Gotham',
              color: Colors.white,
          ),),
             elevation: 2,
             onPressed: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => SignUpClass()),
               );
             },
      ),
           ),
          ],

        ),
      ),
    );
  }

  //Validate user and Log in User
  Future<void> signIn() async {

    _email = _emailcontroller.text;
    _password = _passwordcontroller.text;

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

      //Validate User
      await FirebaseAuth.instance.signInWithEmailAndPassword(email:_emailcontroller.text , password: _passwordcontroller.text);
      pr.hide().then((isHidden) {
        print(isHidden);
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }catch(e){
      pr.hide().then((isHidden) {
        print(isHidden);
      });
      print(e.message);
      String getmessage = e.message;
      Fluttertoast.showToast(
          msg: getmessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey.shade200,
          textColor: Colors.black,
          fontSize: 16.0
      );
    }
  }


}



