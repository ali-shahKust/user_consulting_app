import 'package:designsaeed/homepage/StartALawSuit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'AskAQuotation.dart';
import 'HomePage.dart';


class Lawsuit extends StatefulWidget {
  @override
  _LawsuitState createState() => _LawsuitState();
}

class _LawsuitState extends State<Lawsuit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,size: 25.0,), onPressed: (){
          Navigator.pop(context);
        }),
        backgroundColor: appColor,
        centerTitle: true,
        title: Text("Lawsuit",style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.w600,
            fontFamily: 'Gotham',
            fontSize: 20.0
        ),
        ),
      ),
      body: Column(
        children: <Widget>[
          homePageContainer(
            avatar: CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage("assets/askAQuotation.png"),
            ),
            text: Text("Ask a quotation",style: TextStyle(
                fontWeight: FontWeight.w700,
              fontFamily: 'Gotham',
            ),),
            iconButton: IconButton(
                icon: Icon(CupertinoIcons.forward),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AskAQuotation()));
                }),
          ),
          homePageContainer(
            avatar: CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage("assets/lawsuit.png"),
            ),
            text: Text("Start a lawsuit",style: TextStyle(
                fontWeight: FontWeight.w700,
              fontFamily: 'Gotham',
            ),),
            iconButton: IconButton(
                icon: Icon(CupertinoIcons.forward),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>StartALawSuit()));
                }),
          ),
        ],
      ),
    );
  }
}

