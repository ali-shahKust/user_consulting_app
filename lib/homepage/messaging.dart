import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:emoji_picker/emoji_picker.dart';
import '../constants.dart';

class ChatScreen extends StatefulWidget  {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>{
  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(context,
      height: 1920, // Optional
      width: 1080, // Optional
      allowFontScaling: true, // Optional
    );
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,size: 25.0,), onPressed: (){
          Navigator.pop(context);
        }),
        backgroundColor: appColor,
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 16.0,
                backgroundImage: AssetImage('assets/logo.png'),
              ),
            ),sizedBoxWidth,
            Text("Lex futura ",style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: 'Gotham',
                fontSize: 20.0
            ),
            ),
            CircleAvatar(
              radius: 5.0,
              backgroundColor: Colors.green,
            )
          ],
        ),
        actions: <Widget>[
          Icon(Icons.phone),
          sizedBoxWidth,
          Icon(Icons.video_call),
          sizedBoxWidth,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: ResponsiveContainer(
                widthPercent: 80.0,
                heightPercent: 8.0,
                child: Container(
                  child: TextFormField(
                    decoration:  InputDecoration(
                        hintText: 'Type here',
                        fillColor: Colors.white,
                        filled: true,
                        border:  OutlineInputBorder(
                          borderRadius:  BorderRadius.circular(30.0),
                        ),
                        prefixIcon: IconButton(
                            icon : FaIcon(FontAwesomeIcons.smile),
                          onPressed: (){
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainPage()));
                          },
                        )
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CircleAvatar(
                backgroundColor: appColor,
                child: Icon(Icons.keyboard_voice,color: Colors.white,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
//class MainPage extends StatefulWidget {
//
//  @override
//  MainPageState createState() => new MainPageState();
//
//}
//
//class MainPageState extends State<MainPage> {
//
//  @override
//  Widget build(BuildContext context) {
//
//
//    return EmojiPicker(
//      rows: 3,
//      columns: 7,
//      buttonMode: ButtonMode.MATERIAL,
//      recommendKeywords: ["racing", "horse"],
//      numRecommended: 10,
//      onEmojiSelected: (emoji, category) {
//        print(emoji);
//      },
//    );
//
//  }
//
//}