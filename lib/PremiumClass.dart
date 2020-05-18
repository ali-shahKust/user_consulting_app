import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_container/responsive_container.dart';

import 'constants.dart';

class PremiumClass extends StatefulWidget {
  @override
  _PremiumClassState createState() => _PremiumClassState();
}

class _PremiumClassState extends State<PremiumClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,size: 25.0,), onPressed: (){
          Navigator.pop(context);
        }),
        backgroundColor: appColor,
        centerTitle: true,
        title: Text("Business profile",style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.w600,
            fontFamily: 'Gotham',
            fontSize: 20.0
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              sizedBoxHeight,
              sizedBoxHeight,
              sizedBoxHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom:10.0),
                    child: Text("€",style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Gotham',
                        fontSize: 25.0
                    ),),
                  ),
                  Text("70",style: TextStyle(
                    color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Gotham',
                      fontSize: 30.0
                  ),),
                  Text("/m",style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Gotham',
                    fontSize: 20.0

                  ),)
                ],
              ),
              sizedBoxHeight,
              Text("Cancel when you want",style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Gotham',

              ),),
              sizedBoxHeight,
              sizedBoxHeight,
              RowRepetable(textOfRow: Text("24 h assistance",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontFamily: 'Gotham',
              ),),),
              Divider(color: Colors.black,thickness: 1.0,),
              sizedBoxHeight,

              sizedBoxHeight,
              RowRepetable(textOfRow: Text("Contracts and memos",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontFamily: 'Gotham',
              ),),),
              Divider(color: Colors.black,thickness: 1.0,),
              sizedBoxHeight,

              sizedBoxHeight,
              RowRepetable(textOfRow: Text("Legal newsletters ",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontFamily: 'Gotham',
              ),),),
              Divider(color: Colors.black,thickness: 1.0,),
              sizedBoxHeight,

              sizedBoxHeight,
              RowRepetable(textOfRow: Text("1h answer",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontFamily: 'Gotham',
              ),),),
              Divider(color: Colors.black,thickness: 1.0,),
              sizedBoxHeight,

              sizedBoxHeight,
              RowRepetable(textOfRow: Text("Labour law assistance",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontFamily: 'Gotham',
              ),),),
              Divider(color: Colors.black,thickness: 1.0,),
              sizedBoxHeight,

              sizedBoxHeight,
              RowRepetable(textOfRow: Text("Lawyer consulting",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontFamily: 'Gotham',
              ),),),
              Divider(color: Colors.black,thickness: 1.0,),
              sizedBoxHeight,
              sizedBoxHeight,
              sizedBoxHeight,

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ResponsiveContainer(
                  heightPercent: 8.0,
                  widthPercent: 100.0,
                  child: RaisedButton(
                    color:appColor,
                    child: Text('PAY WITH PAYPAL',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.0,
                        fontSize: 18.0
                      ),),
                    elevation: 2,
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
      ),
    );
  }
}

class RowRepetable extends StatelessWidget {
  RowRepetable({this.textOfRow});
final Text textOfRow;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        textOfRow,
        ResponsiveContainer(widthPercent: 25.0, heightPercent: 3.5,
          child: Container(
            child: Center(
              child: Text("Unlimited",style: TextStyle(
                color: Colors.white
              ),),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        )
      ],
    );
  }
}
