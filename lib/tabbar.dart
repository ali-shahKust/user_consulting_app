import 'package:designsaeed/Profile.dart';
import 'package:designsaeed/constants.dart';
import 'package:designsaeed/homepage/LegalOpinion.dart';
import 'package:designsaeed/homepage/StartALawSuit.dart';
import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,size: 25.0,), onPressed: (){
            Navigator.pop(context);
          }),
          backgroundColor: appColor,
          centerTitle: true,
          title: Text("Profile",style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: 'Gotham',
              fontSize: 20.0,
          ),
          ),
          bottom: TabBar(

            indicatorColor: Colors.white,
            isScrollable: true,
            tabs: [
              Tab(text: "LEGAL TIP",),
              Tab(text: "LEGAL OPINION",),
              Tab(text: "CONTRACT",),
              Tab(text: "LAW SUIT",),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Profile(),
           Profile(),
            Profile(),
            Profile(),
          ],
        ),
      ),
    );
  }
}