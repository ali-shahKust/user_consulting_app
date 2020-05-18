import 'package:designsaeed/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_time_format/date_time_format.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
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
      ),
      body : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              sizedBoxHeight,
              repeatableRowProfile(
                  text:   Text("Legal tip",style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0,
                      fontFamily: 'Gotham'
                  ),),
                  decisionalText:  Text("Pending",style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Gotham'
                  ),),
                  dateTime: dateTime
              ),
              sizedBoxHeight,
              Divider(color: Colors.grey,thickness: 1.0,),

              sizedBoxHeight,
              repeatableRowProfile(
                  text: Text("Legal opinion",style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0,
                      fontFamily: 'Gotham'
                  ),),
                  decisionalText:  Text("In progress",style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Gotham'
                  ),),
                  dateTime: dateTime),
              sizedBoxHeight,
              Divider(color: Colors.grey,thickness: 1.0,),

              sizedBoxHeight,
              repeatableRowProfile(
                  text: Text("Contract",style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0,
                      fontFamily: 'Gotham'
                  ),),
                  decisionalText:  Text("Finished",style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Gotham'
                  ),),
                  dateTime: dateTime),
              sizedBoxHeight,
              Divider(color: Colors.grey,thickness: 1.0,),
              sizedBoxHeight,
              repeatableRowProfile(
                  text:  Text("Lawsuit",style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0,
                      fontFamily: 'Gotham'
                  ),),
                  decisionalText:  Text("In progress",style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Gotham'
                  ),),
                  dateTime: dateTime),
              sizedBoxHeight,
              Divider(color: Colors.grey,thickness: 1.0,),
            ],
          ),
        ),
      ),
    );
  }
}

class repeatableRowProfile extends StatelessWidget {
 repeatableRowProfile({this.dateTime,this.text,this.decisionalText});

  final DateTime dateTime;
  final Text text;
  final Text decisionalText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        text,
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
           decisionalText,
            sizedBoxHeight,
            Text(DateTimeFormat.format(dateTime, format: 'd-m-Y'),style: TextStyle(
              color: Colors.grey
            ),),
          ],
        ),
          ],
        );
  }
}



