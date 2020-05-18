import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_container/responsive_container.dart';

import '../constants.dart';

class StartALawSuit extends StatefulWidget {
  @override
  _StartALawSuitState createState() => _StartALawSuitState();
}

class _StartALawSuitState extends State<StartALawSuit> {
  @override
  Widget build(BuildContext context) {
    showAlertDialog(BuildContext context, String message, IconButton iconButton) {
      // set up the buttons


      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
        ) ,
        title: iconButton,
        content: Text(message,style: TextStyle(
          fontWeight: FontWeight.w700,
        ),),
        actions: [
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,size: 25.0,), onPressed: (){
          Navigator.pop(context);
        }),
        backgroundColor: appColor,
        centerTitle: true,
        title: Text("Start a lawsuit",style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.w600,
            fontFamily: 'Gotham',
            fontSize: 20.0
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StartlawsuitContainer (
              avatar: CircleAvatar (
                backgroundColor: Colors.blue.shade50,
                child: Text ( "1",style: styleofstartlawsuit, ),
              ),
              text: Text ( "Power of attorney", style: styleofstartlawsuit, ),
            ),
            StartlawsuitContainer (
              avatar: CircleAvatar (
                backgroundColor: Colors.blue.shade50,
                child: Text ( "2",style: styleofstartlawsuit, ),
              ),
              text: Text ( "Quotation/Contract", style: styleofstartlawsuit, ),
            ),
            StartlawsuitContainer (
              avatar: CircleAvatar (
                backgroundColor: Colors.blue.shade50,
                child: Text ( "3" ,style: styleofstartlawsuit,),
              ),
              text: Text ( "Doc.1", style: styleofstartlawsuit, ),
            ),
            StartlawsuitContainer (
              avatar: CircleAvatar (
                backgroundColor: Colors.blue.shade50,
                child: Text ( "4" ,style: styleofstartlawsuit,),
              ),
              text: Text ( "Doc.2", style: styleofstartlawsuit, ),
            ),
            StartlawsuitContainer (
              avatar: CircleAvatar (
                backgroundColor: Colors.blue.shade50,
                child: Text ( "5",style: styleofstartlawsuit, ),
              ),
              text: Text ( "Doc.3", style: styleofstartlawsuit, ),
            ),
            StartlawsuitContainer (
              avatar: CircleAvatar (
                backgroundColor: Colors.blue.shade50,
                child: Text ( "6",style: styleofstartlawsuit, ),
              ),
              text: Text ( "Doc.4", style: styleofstartlawsuit, ),
            ),
            StartlawsuitContainer (
              avatar: CircleAvatar (
                backgroundColor: Colors.blue.shade50,
                child: Text ( "7",style: styleofstartlawsuit, ),
              ),
              text: Text ( "Doc.5", style: styleofstartlawsuit, ),
            ),
            sizedBoxHeight,
            sizedBoxHeight,
            ResponsiveContainer(
              heightPercent: 8.0,
              widthPercent: 90.0,
              child: RaisedButton(
                onPressed: () {
                  showAlertDialog(context, 'Informormation has been sent.',
                      IconButton(icon: Icon(Icons.check_circle_outline,size: 50.0,),
                          color: Colors.green,
                          onPressed: (){}));
                },
                color: appColor,
                child : Row(
                  children: <Widget>[
                    FaIcon(FontAwesomeIcons.ccVisa,color: Colors.white,),
                    sizedBoxWidth,
                    sizedBoxWidth,
                    sizedBoxWidth,
                    sizedBoxWidth,
                    sizedBoxWidth,
                    sizedBoxWidth,
                    sizedBoxWidth,
                    sizedBoxWidth,
                    Text("PAYMENT",style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gotham',
                        fontWeight: FontWeight.w700,
                        fontSize: 17.0
                    ),),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            ),sizedBoxHeight,

          ],
        ),
      ),
    );
  }
}

class StartlawsuitContainer extends StatelessWidget {
  StartlawsuitContainer({this.text,this.avatar});
  final CircleAvatar avatar;
  final Text text;


  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Card(
      elevation: 5.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
           avatar,
            SizedBox(
              width: 40.0,
            ),
            text
          ],
        ),
      ),
    ),
    );
  }
}
