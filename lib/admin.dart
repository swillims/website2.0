import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'util.dart';
import 'sidebar.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Admin extends StatefulWidget 
{
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> 
{
  String userEmail="";
  String userPassword="";

  @override
  Widget build(BuildContext context)
  {
    User? user = FirebaseAuth.instance.currentUser;
    if(user==null)
    {
      return notLoginedIn(context);
    }

    return Scaffold
    (
      body: Row
      (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: 
        [
          Sidebar(),
          SingleChildScrollView
          (
            child: Container
            (
              width: MediaQuery.of(context).size.width * 0.85,
              //color: Colors.grey,
              child: Column
              (
                children: 
                []
              )
            )
          )
        ]
      )
    );
  }
  Scaffold notLoginedIn(BuildContext context)
  {
    return Scaffold
    (
      body: Row
      (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: 
        [
          Sidebar(),
          SingleChildScrollView
          (
            child: Container
            (
              width: MediaQuery.of(context).size.width * 0.85,
              //color: Colors.grey,
              child: Padding
              (
                padding: EdgeInsets.all(12.0),
                child: Column
                (
                  mainAxisSize: MainAxisSize.min,
                  children: 
                  [
                    Row
                    (
                      children: 
                      [
                        SizedBox
                        (
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: Text("Login Email:"),
                        ),
                        SizedBox
                        (
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: TextField
                          (
                            decoration: InputDecoration
                            (
                              border: OutlineInputBorder(),
                              labelText: 'name@example.com',
                            ),
                            onChanged: (value) {userEmail = value; }
                          ),
                        )
                      ],
                    ),
                    Row
                    (
                      children: 
                      [
                        SizedBox
                        (
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: Text("Password:"),
                        ),
                        SizedBox
                        (
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: TextField
                          (
                            decoration: InputDecoration
                            (
                              border: OutlineInputBorder(),
                              labelText: 'A#123456',
                            ),
                            obscureText: true,
                            onChanged: (value){ userPassword = value; }
                          ),
                        )
                      ],
                    ),
                    TextButton
                    (
                      onPressed: (){login(userEmail, userPassword);},
                      child: Text("Login")
                    )
                  ],
                )
              )
            )
          )
        ]
      )
    );
  }
  void login(String email, String password) async
  {

  }
}

