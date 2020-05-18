import 'package:designsaeed/constants.dart';
import 'package:designsaeed/homepage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:responsive_container/responsive_container.dart';

class LegalOpinion extends StatefulWidget {
  @override
  _LegalOpinionState createState() => _LegalOpinionState();
}

class _LegalOpinionState extends State<LegalOpinion> {

  @override
  Widget build(BuildContext context)  {
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
      appBar:AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,size: 25.0,), onPressed: (){
          Navigator.pop(context);
        }),
        backgroundColor: appColor,
        centerTitle: true,
        title: Text("Legal opinion",style: TextStyle(color: Colors.white,
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
              Align(
                  alignment: Alignment.topLeft,
                  child: Text("Describe your legal issue",style: TextStyle(
                    color: Colors.black,
                      fontFamily: 'Gotham',
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0
                  ),)),
              sizedBoxHeight,
              TextFormField(
                maxLines: 7,
                decoration:  InputDecoration(
                   hintText: "Type here",
                    fillColor: Colors.white,
                    border:  OutlineInputBorder(
                      borderRadius:  BorderRadius.circular(4.0),
                      borderSide:  BorderSide(
                      ),
                    ),
                ),
                keyboardType: TextInputType.text,
              ),
              sizedBoxHeight,
              Align(
                alignment: Alignment.bottomRight,
                child: Text("0/300",),
              ),
              sizedBoxHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Upload documents",style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Gotham',
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0
                  ),),
                  FloatingActionButton(onPressed: (){},
                    backgroundColor: appColor,
                    child: Icon(Icons.add,color: Colors.white,size: 35.0,),
                  ),
                ],
              ),
              sizedBoxHeight,
              sizedBoxHeight,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    documentsUpload(),
                    documentsUpload(),
                    documentsUpload()
                  ],
                ),
              ),sizedBoxHeight,
              SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    documentsUpload(),
                    documentsUpload(),
                    documentsUpload()
                  ],
                ),
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
                  child: Text("SUBMIT",style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Gotham',
                      fontWeight: FontWeight.w700,
                      fontSize: 17.0
                  ),),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
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

class documentsUpload extends StatelessWidget {
  const documentsUpload({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset("assets/file.png"),
        Text("Documents.docx",style: TextStyle(
          color: Colors.black,
          fontFamily: 'Gotham'
        ),)
      ],
    );
  }
}

