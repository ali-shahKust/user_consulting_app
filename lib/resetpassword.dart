//import 'package:designsaeed/constants.dart';
//import 'package:flutter/material.dart';
//import 'package:responsive_container/responsive_container.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'login.dart';
//class ResetPasswordClass extends StatefulWidget {
//  @override
//  _ResetPasswordClassState createState() => _ResetPasswordClassState();
//}
//
//class _ResetPasswordClassState extends State<ResetPasswordClass> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: SingleChildScrollView(
//        child: Column(
//          children: <Widget>[
//            ResponsiveContainer(
//              heightPercent:30.0,
//              widthPercent: 100.0,
//              child: Container(
//                  child: Image.asset('assets/background.png',
//                    alignment: Alignment.topCenter,
//                    fit: BoxFit.fill,
//                  )),
//            ),
//            Padding(
//              padding: const EdgeInsets.all(10.0),
//              child: Card(
//                elevation: 3,
//                  color: Colors.white,
//               child: Column(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(top:10.0,bottom: 10),
//                     child: Text(
//                       "Reset password",
//                       style: TextStyle(
//                           fontFamily: 'Gotham',
//                           fontSize: 18.0),
//                     ),
//                   ),
//
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: TextField(icons :FaIcon(FontAwesomeIcons.eyeSlash),TextName: "Password"),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: TextField(icons :FaIcon(FontAwesomeIcons.eyeSlash) ,TextName: "Confirm password",),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: ResponsiveContainer(
//                       heightPercent: 8.0,
//                       widthPercent: 100.0,
//                       child: RaisedButton(
//                         color:appColor,
//                         child: Text('RESET',
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),),
//                         elevation: 2,
//                         shape: new RoundedRectangleBorder(
//                           borderRadius: new BorderRadius.circular(30.0),
//                         ),
//                         onPressed: (){
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => Login()),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//               ],),
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
//class TextField extends StatelessWidget {
//
//  TextField({
//    this.TextName,
//    this.icons,
//    this.hintText});
//
//  final String TextName;
//  final FaIcon icons;
//  final String hintText;
//  @override
//  Widget build(BuildContext context) {
//    return TextFormField(
//      decoration:  InputDecoration(
//          hintText: '',
//          labelText: TextName,
//          fillColor: Colors.white,
//          border:  OutlineInputBorder(
//            borderRadius:  BorderRadius.circular(8.0),
//            borderSide:  BorderSide(
//            ),
//          ),
//          suffixIcon: Padding(
//            padding: const EdgeInsets.only(top: 8.0),
//            child: icons,
//          )
//
//        //fillColor: Colors.green
//      ),
//      keyboardType: TextInputType.emailAddress,
//
//    );
//  }
//}
