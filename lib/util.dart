import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

void signIn(String useremail, String userpassword) async
{
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword
    (
      email: useremail,
      password: userpassword,
    );
  }catch (e) {}
}

Future<void> signInAnonymously() async
{
  try
  {
    await FirebaseAuth.instance.signInAnonymously();
  } catch (e) {
    print("Failed to sign in anonymously: $e");
  }
}

class MediaHolder
{
  String projectName;
  String description;
  String? mediaPath;
  Widget? media;

  MediaHolder
  ({
    required this.projectName,
    required this.description,
    this.mediaPath,
    //Key? key,
  });// : super(key: key);

  //@override
  //Widget build(BuildContext context)
  Widget getWidgetQuickLoad()
  {
    if(mediaPath==null || mediaPath=="")
    {
      return Container
      (
        decoration: BoxDecoration
        (
          border: Border.all
          (
            color: Colors.grey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(12.0),
        child: Column
        (
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: 
          [
            Text
            (
              projectName,
              style: TextStyle
              (
                fontSize: 20
              ),
            ),
            Text
            (
              description,
              style: TextStyle
              (
                fontSize: 18
              ),
            )
          ]),
      );
    }
    return Container
    (
      decoration: BoxDecoration
      (
        border: Border.all
        (
          color: Colors.grey,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(12.0),
      child: Row
      (
        children: 
        [

        ],
      )
    );
  }
  Future<Widget> getFullWidget () async
  {
    if(mediaPath==null || mediaPath=="")
    {
      return getWidgetQuickLoad();
    }
    // change after refactor
    return getWidgetQuickLoad();
  }
}