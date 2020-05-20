import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designsaeed/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LegalOpinion extends StatefulWidget {
  Map _map;

  LegalOpinion(Map map){
    this._map = map;
    print('my data is $_map');

    _map['user_id'];


  }

  @override
  _LegalOpinionState createState() => _LegalOpinionState(_map);
}


final _descriptionController = new TextEditingController();

class _LegalOpinionState extends State<LegalOpinion> {
  Map _map;
  _LegalOpinionState(this._map);
  bool _validate = false;
  bool isChecked = true;
  String lawyer_id= '';
  String myname = '';
  String lawyer_name ='';
  DocumentSnapshot mRef;
  String stringValue;
  var url;
//Init function will be called on Start to get Details of users
  @override
  void initState() {
    // TODO: implement initState
     getInfo();
    super.initState();
  }
  StorageReference _storageReference;
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
                controller: _descriptionController,
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
                Column(
                children: <Widget>[
                    GestureDetector(
                        onTap: (){
                          pickDoc();
                        },
                        child: Image.asset("assets/file.png")),
                Text("Documents.docx",style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Gotham'
                ),)
                ],
              )
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
                    uploadDocumentToDb();
                    showAlertDialog(context, 'Informormation has been sent.',
                        IconButton(icon: Icon(Icons.check_circle_outline,size: 50.0,),
                            color: Colors.green,
                            onPressed: (){
                          Navigator.pop(context);
                            }));
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
  Future<String> pickDoc() async {
    File file =
    await FilePicker.getFile(type: FileType.custom, allowedExtensions:['jpg', 'pdf', 'doc']);
    List<File> files = await FilePicker.getMultiFile(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );
    _storageReference = FirebaseStorage.instance
        .ref()
        .child('${DateTime.now().millisecondsSinceEpoch}');
    StorageUploadTask storageUploadTask = _storageReference.putFile(file);
    url = await (await storageUploadTask.onComplete).ref.getDownloadURL();
    Fluttertoast.showToast(
        msg: "Document Uploaded",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.grey.shade300,
        textColor: Colors.black,
        fontSize: 16.0
    );

    setState(() {

    });

    print("URL: $url");

    return url;
  }

  void getInfo() async {
    mRef = await Firestore.instance
        .collection("Users")
        .document((await FirebaseAuth.instance.currentUser()).uid)
        .get();
    setState(() {
    });
  }

  //Function will be called On Request Send
  void uploadDocumentToDb() async{
    try{
      DocumentReference ref = await databaseReference.collection("My Request")
          .add({
        'lawyer_uid': _map['user_uid'],
        'opinion_description': _descriptionController.text,
        'opinion_document': url,
        'client_uid': (await FirebaseAuth.instance.currentUser()).uid,
        'username': mRef['username'],
        'user_dp': mRef['user_dp'],
        'lawyer_name': _map['username'],
        'lawyer_dp':_map['user_dp'],
        'chat_status': isChecked

      });
      Fluttertoast.showToast(
          msg: "Request Send To Lawyer",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey.shade300,
          textColor: Colors.black,
          fontSize: 16.0
      );
    }catch(e){
      Fluttertoast.showToast(
          msg: e.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey.shade300,
          textColor: Colors.black,
          fontSize: 16.0
      );
    }

  }
}

class documentsUpload extends StatefulWidget {

  const documentsUpload({
    Key key,
  }) : super(key: key);

  @override
  _documentsUploadState createState() => _documentsUploadState();
}
//Variables

//Refrence for Firebase
final databaseReference = Firestore.instance;
class _documentsUploadState extends State<documentsUpload> {
  //Variables


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




