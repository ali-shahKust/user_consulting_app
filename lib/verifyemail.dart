//import 'package:designsaeed/constants.dart';
//import 'package:flutter/material.dart';
//import 'package:responsive_container/responsive_container.dart';
//
//import 'login.dart';
//class VerifyEmailClass extends StatefulWidget {
//  @override
//  _VerifyEmailClassState createState() => _VerifyEmailClassState();
//}
//
//class _VerifyEmailClassState extends State<VerifyEmailClass> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: SingleChildScrollView(
//        child: Column(
//          children: <Widget>[
//            ResponsiveContainer(
//              heightPercent: 30.0,
//              widthPercent: 100.0,
//              child: Container(
//                  child: Image.asset('assets/background.png',
//                    alignment: Alignment.topCenter,
//                    fit: BoxFit.fill,
//                  )),
//            ),
//
//            Padding(
//              padding: const EdgeInsets.all(10.0),
//              child: Card(
//                elevation: 3,
//                color: Colors.white,
//                child: Column(
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.all(10.0),
//                      child: Text(
//                        "Verification code is send to email",
//                        style: TextStyle(
//                            fontFamily: 'Gotham',
//                            color: Colors.black,
//                            fontWeight: FontWeight.bold,
//                            fontSize: 18.0, ),
//                      ),
//                    ),
//
//                    Padding(
//                      padding: const EdgeInsets.all(10.0),
//                      child: TextField(TextName: "Enter verification code"),
//                    ),
//
//                    Padding(
//                      padding: const EdgeInsets.all(10.0),
//                      child: ResponsiveContainer(
//                        heightPercent: 8.0,
//                        widthPercent: 100.0,
//                        child: RaisedButton(
//                          color:appColor,
//                          child: Text('VERIFY',
//                            style: TextStyle(
//                              color: Colors.white,
//                            ),),
//                          elevation: 2,
//                          shape: new RoundedRectangleBorder(
//                            borderRadius: new BorderRadius.circular(30.0),
//                          ),
//                          onPressed: (){
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(builder: (context) => Login()),
//                            );
//                          },
//                        ),
//                      ),
//                    ),
//                  ],),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//
