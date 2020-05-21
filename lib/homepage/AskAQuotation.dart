import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_container/responsive_container.dart';

import '../constants.dart';
import 'HomePage.dart';
import 'LegalOpinion.dart';

class AskAQuotation extends StatefulWidget {

  Map _map;

  AskAQuotation(Map map) {
    this._map = map;
    print('my data is $_map');

    _map['user_id'];
  }
  @override
  _AskAQuotationState createState() => _AskAQuotationState(_map);
}
final askquoteController = TextEditingController();
class _AskAQuotationState extends State<AskAQuotation> {
  Map _map;
  _AskAQuotationState(this._map);
  bool _validate = false;
  bool isChecked = true;
  String lawyer_id= '';
  String myname = '';
  String lawyer_name ='';
  DocumentSnapshot mRef;
  StorageReference _storageReference;
  String stringValue;
  var url;
  @override
  void initState() {
    // TODO: implement initState
    getInfo();
    super.initState();
  }
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,size: 25.0,), onPressed: (){
          Navigator.pop(context);
        }),
        backgroundColor: appColor,
        centerTitle: true,
        title: Text("Ask a quotation",style: TextStyle(color: Colors.white,
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
                  child: Text("Which lawsuit do you want to start?",style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Gotham',
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0
                  ),)),
              sizedBoxHeight,
              TextFormField(
                controller: askquoteController,
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
                child: Text("0/300"),
              ),
              sizedBoxHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Upload documents",style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Gotham',
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Image.asset("assets/file.png"),
                        Text("Documents.docx",style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Gotham'
                        ),)
                      ],
                    )

                  ],
                ),
              ),sizedBoxHeight,

              sizedBoxHeight,
              sizedBoxHeight,
              ResponsiveContainer(
                heightPercent: 8.0,
                widthPercent: 90.0,
                child: RaisedButton(onPressed: () {
                  showAlertDialog(context, 'Informormation has been sent.',
                      IconButton(icon: Icon(Icons.check_circle_outline,size: 50.0,),
                          color: Colors.green,
                          onPressed: (){}));
                },
                  color: appColor,
                  child: Text("SUBMIT",style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Gotham',
                      fontWeight: FontWeight.w900,
                      fontSize: 18.0
                  ),),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
              )
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
      DocumentReference ref = await databaseReference.collection("ask quotes")
          .add({
        'lawyer_uid': _map['user_uid'],
        'ask_quottation': askquoteController.text,
        'quotes_document': url,
        'client_uid': (await FirebaseAuth.instance.currentUser()).uid,
        'username': mRef['username'],
        'user_dp': mRef['user_dp'],
        'lawyer_name': _map['username'],
        'lawyer_dp':_map['user_dp'],
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
