import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designsaeed/searchLawyer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'package:path/path.dart';

import 'constants.dart';
import 'homepage/HomePage.dart';


class Profile_Setting extends StatefulWidget {


  @override
  _Profile_SettingState createState() => _Profile_SettingState();
}

class _Profile_SettingState extends State<Profile_Setting> {



  bool isloading = true;
  String dropdownValue = 'Major';
  String mName = '';
  String mType = '';
  String mPhoneNum = '';
  String mLicenceNumber = '';
  String mYearExperience = '';
  String mDescription = '';
  DocumentSnapshot mRef;
  final _namecontroller = TextEditingController();
  final _phonecontroller = TextEditingController();
//  final _licencecontroller = TextEditingController();
  final _majorcontroller = TextEditingController();
  final _xpcontroller = TextEditingController();
  final _descriptioncontroller = TextEditingController();
  final _feescontroller = TextEditingController();
  final databaseReference = Firestore.instance;


  File _image;
  String _uploadedFileURL;
  String url;
  @override
  void initState() {
    getData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    if(mRef != null){
      _namecontroller.text = mRef['username'];
      _phonecontroller.text = mRef['phonenumber'];
      _majorcontroller.text = mRef['type'];
      _xpcontroller.text = mRef['year_experience'];
      _feescontroller.text = mRef['fees'];
      _descriptioncontroller.text = mRef['description'];

    }



    return Scaffold(
      backgroundColor: Colors.white,

      body: isloading ? Container() : ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                color: appColor,
              ),
              Center(
                child: Column(
                    children: <Widget>[

                      Container(
                          height: 90,
                          margin: EdgeInsets.only(top: 60),
                          child: GestureDetector(
                            onTap: () {
                              uploadPic();                            },
                            child: CircleAvatar(

                              radius: 50,
                              backgroundColor: Colors.white,

                              backgroundImage: mRef['user_dp'] == null
                                  ? AssetImage('images/profile.png')
                                  : NetworkImage(mRef['user_dp']),

                            ),
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                      ),
                      mRef['username'] == null ? Text('No Data'):
                      Text(
                        mRef['username'],
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                      ),
                      mRef['type'] == null ? Text('No Details'):
                      Text(
                        mType,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ]),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(

            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: TextField(

                controller: _namecontroller,
                onChanged: (String value) {},
                cursorColor: appColor,
                decoration: InputDecoration(
                  //  prefixText:mRef['username'] ,
                    hintText: "Name",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.email,
                        color: appColor,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: TextField(
                maxLength: 10,
                controller: _phonecontroller,
                onChanged: (String value) {},
                cursorColor: appColor,
                decoration: InputDecoration(
                    hintText: "Phone Number",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.phone,
                        color:appColor,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),


          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: TextField(
                controller: _majorcontroller,
                onChanged: (String value) {},
                cursorColor: appColor,
                decoration: InputDecoration(
                    hintText: "Major",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.library_books,
                        color:appColor,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: TextField(
                controller: _xpcontroller,
                onChanged: (String value) {},
                cursorColor: appColor,
                decoration: InputDecoration(
                    hintText: "Experience Year",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.event,
                        color: appColor,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: TextField(
                controller: _feescontroller,
                onChanged: (String value) {},
                cursorColor: appColor,
                decoration: InputDecoration(
                    hintText: "Fees Price in \$",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.attach_money,
                        color: appColor,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: TextField(
                controller: _descriptioncontroller,
                onChanged: (String value) {},
                cursorColor: appColor,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    hintText: "Description",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.description,
                        color: appColor,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ), SizedBox(
            height: 20,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.shade50),
                child: FlatButton(

                  child: Row(
                    children: <Widget>[
                      Icon(Icons.library_books,
                        color: appColor,
                      ),
                      SizedBox(width: 12,),
                      Text(
                        "Lic# ${mRef['licencenumber']}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      ),
                    ],
                  ),

                ),
              )),
          SizedBox(height: 20,),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: appColor),
                child: FlatButton(

                  child: Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  onPressed: () {
                    createRecord();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Search_Lawyer_Page()));
                  },
                ),
              )),
        ],
      ),
    );
  }
//Get data From Database
  void getData() async {
    mRef = await Firestore.instance
        .collection("Lawyers")
        .document((await FirebaseAuth.instance.currentUser()).uid)
        .get();
    setState(() {
      isloading = false;
      mName = mRef['username'];
      mType = mRef['type'];
    });
  }
//update User Profile
  void createRecord() async {
    try {
      String mUid = (await FirebaseAuth.instance.currentUser()).uid;
      //Firestore
      await databaseReference.collection("Users").document(mUid).setData({
        'username': _namecontroller.text,
        'phone_number': _phonecontroller.text,
        'year_experience': _xpcontroller.text,
        'type': _majorcontroller.text,
        'description': _descriptioncontroller.text,
        'fees':_feescontroller.text
      }, merge: true);
      Fluttertoast.showToast(
          msg: "Profile Updated",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey.shade200,
          textColor: Colors.black,
          fontSize: 16.0
      );
    }
    catch (e) {
      print(e.message);
    }
  }

  FirebaseStorage _storage = FirebaseStorage.instance;
//Upload Profile Picture To Database
  Future<Uri> uploadPic() async {

    //Get the file from the image picker and store it
    _image = await ImagePicker.pickImage(source: ImageSource.gallery);

    String mUid = (await FirebaseAuth.instance.currentUser()).uid;

    //Create a reference to the location you want to upload to in firebase
    StorageReference reference = _storage.ref().child("Profile/").child((await FirebaseAuth.instance.currentUser()).uid);

    //Upload the file to firebase
    StorageUploadTask uploadTask = reference.putFile(_image);
    uploadTask.onComplete.then((result) async {
      url = await result.ref.getDownloadURL();

      await databaseReference.collection("Userss").document(mUid).updateData({

        'user_dp': url,
      });
      Fluttertoast.showToast(
          msg: 'Profile Picture Updated',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey.shade200,
          textColor: Colors.black,
          fontSize: 16.0
      );
      setState(() {

      });
    });

  }


}
