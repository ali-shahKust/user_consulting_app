import 'package:designsaeed/PremiumClass.dart';
import 'package:designsaeed/homepage/Lawsuit.dart';
import 'package:designsaeed/homepage/LegalOpinion.dart';
import 'package:designsaeed/homepage/contract.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

import '../constants.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:appColor,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,size: 25.0,), onPressed: (){
          Navigator.pop(context);
        }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            homePageContainer(
              avatar: CircleAvatar(
                radius: 25.0,
                backgroundImage : AssetImage("assets/legaltip.png"),
              ),
              text: Text("Legal tips",style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Gotham',
            ),),
              iconButton: IconButton(
                  icon: Icon(CupertinoIcons.forward),
                  onPressed: (){}),
            ),
            homePageContainer(
              avatar: CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage("assets/legalopinion.png"),
              ),
              text: Text("Legal opinion",style: TextStyle(
                  fontWeight: FontWeight.w700,
                fontFamily: 'Gotham',
              ),),
            iconButton: IconButton(
                icon: Icon(CupertinoIcons.forward),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LegalOpinion()));
                }),
            ),
            homePageContainer(
              avatar: CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage("assets/contract.png"),
              ),
              text: Text("Contract",style: TextStyle(
                  fontWeight: FontWeight.w700,
                fontFamily: 'Gotham',
              ),),
              iconButton: IconButton(
                  icon: Icon(CupertinoIcons.forward),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Contract()));
                  }),
            ),
            homePageContainer(
              avatar: CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage("assets/lawsuit.png"),
              ),
              text: Text("Lawsuit",style: TextStyle(
                  fontWeight: FontWeight.w700,
                fontFamily: 'Gotham',
              ),),
              iconButton: IconButton(
                  icon: Icon(CupertinoIcons.forward),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Lawsuit()));
                  }),
            ),
            sizedBoxHeight,
            sizedBoxHeight,
            sizedBoxHeight,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ResponsiveContainer(
                widthPercent: 100.0,
                heightPercent: 8.0,
                child: MaterialButton(
                  color:Color(0xFF001E36),
                  child: Padding(
                    padding: const EdgeInsets.only(top:20.0,bottom: 20.0),
                    child: Text('PREMIUM PROFILE',
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>PremiumClass()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
      backgroundColor: appColor,
        child: Icon(Icons.add,color: Colors.white,size: 35.0,),
      ),

    );
  }
}

class homePageContainer extends StatelessWidget {
  homePageContainer({this.text,this.avatar,this.iconButton,});
  final Text text;
  final CircleAvatar avatar;
  final IconButton iconButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: Colors.white,
      elevation: 5.0,
      child: Padding(padding: EdgeInsets.all(8.0),
               child:  Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                 avatar,
                  text,
                  Center(child: iconButton),
                ],
              ),
      ),
    ),
    );
  }
}

