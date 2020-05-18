import 'package:designsaeed/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_container/responsive_container.dart';


class EnterpriseAndPerson extends StatefulWidget {
  @override
  _EnterpriseAndPersonState createState() => _EnterpriseAndPersonState();
}

class _EnterpriseAndPersonState extends State<EnterpriseAndPerson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ResponsiveContainer(
                  widthPercent: 100,
                  heightPercent: 40,
                  child:  AspectRatio(
                    aspectRatio: 2.0,
                    child: Container(
                        child: Image.asset('assets/person.png',
                          alignment: Alignment.topCenter,
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
                ResponsiveContainer(
                  widthPercent: 100,
                  heightPercent: 40,
                  child: Center(
                    child: InkWell(
                      child: Text('Person',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'Gotham',
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                  ),
                ),

              ],

            ),
            Stack(
              children: <Widget>[
                ResponsiveContainer(
                  widthPercent: 100,
                  heightPercent: 40,
                  child:  AspectRatio(
                    aspectRatio: 2.0,
                    child: Container(
                        child: Image.asset('assets/enterprise.png',
                          alignment: Alignment.topCenter,
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
                ResponsiveContainer(
                  widthPercent: 100,
                  heightPercent: 40,
                  child: Center(
                    child: InkWell(
                      child: Text('Enterprise',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'Gotham',
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                  ),
                ),
              ],

            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: appColor,
      ),
 );
  }
}
