import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'util.dart';
import 'sidebar.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget 
{
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> 
{
  String errorString="";
  String userEmail="";
  String userPassword="";

  bool createAccount = false;

  @override
  Widget build(BuildContext context)
  {
    if(createAccount)
    {
      return createAccountScreen(context);
    }
    User? user = FirebaseAuth.instance.currentUser;
    if(user==null || user.isAnonymous || user.email==null)
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
                [
                  TextButton
                  (
                    onPressed: ()
                    {
                      logout();
                    },
                    child: Text("Logout")
                  )
                ]
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
                padding: EdgeInsets.all(20.0),
                child: Column
                (
                  mainAxisSize: MainAxisSize.min,
                  children: 
                  [
                    Text
                    (
                      errorString,
                      style: TextStyle(color: Colors.red),
                    ),
                    Row
                    (
                      children: 
                      [
                        SizedBox
                        (
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: Text("Email:"),
                        ),
                        SizedBox
                        (
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: TextField
                          (
                            key: Key("LoEm"),
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
                            key: Key("LoPa"),
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
                      onPressed: ()
                      {
                        login(userEmail, userPassword);
                      },
                      child: Text("Login")
                    ),
                    TextButton
                    (
                      onPressed: ()
                      {
                        setState(() 
                        {
                          createAccount = true;
                          errorString = "";
                          userEmail="";
                          userPassword="";
                        });
                      },
                      child: Text("Create Account")
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
  Scaffold createAccountScreen(BuildContext context)
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
                padding: EdgeInsets.all(20.0),
                child: Column
                (
                  mainAxisSize: MainAxisSize.min,
                  children: 
                  [
                    Text
                    (
                      errorString,
                      style: TextStyle(color: Colors.red),
                    ),
                    Row
                    (
                      children: 
                      [
                        SizedBox
                        (
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: Text("Email:"),
                        ),
                        SizedBox
                        (
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: TextField
                          (
                            key: Key("CrEm"),
                            decoration: InputDecoration
                            (
                              border: OutlineInputBorder(),
                              labelText: 'name@example.com',
                            ),
                            //obscureText: true,
                            onChanged: (value){ userEmail = value; }
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
                            key: Key("CrPa"),
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
                      onPressed: ()
                      {
                        createNewAccount(userEmail, userPassword);
                      },
                      child: Text("Create Account")
                    ),
                    TextButton
                    (
                      onPressed: ()
                      {
                        setState(() 
                        {
                          errorString="";
                          userEmail="";
                          userPassword="";
                          createAccount = false;
                        });
                      },
                      child: Text("Back")
                    )
                  ]
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
    if(email==null || email=="")
    {
      setState(() {errorString = "Missing Email";});
      return;
    }
    if(password==null || password=="")
    {
      setState(() {errorString = "Missing Password";});
      return;
    }
    try
    {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      setState(() { errorString = "";});
    }
    catch(e)
    {
      setState(() {errorString = e.toString();});
      return;
    }
  }

  void logout() async
  {
    await FirebaseAuth.instance.signOut();
    await FirebaseAuth.instance.signInAnonymously();
    setState(()
    {
      errorString="";
      userEmail="";
      userPassword="";
      createAccount = false;
    });
  }

  // create account wrote in non-reusabled way because used in one location
  void createNewAccount(String email, String password) async
  {
    if(email==null || email=="")
    {
      setState(() {errorString = "Missing Email";});
      return;
    }
    if(password==null || password=="")
    {
      setState(() {errorString = "Missing Password";});
      return;
    }
    final users = await FirebaseFirestore.instance.collection('users');
    final doc = await users.doc(email).get();
    if(doc.exists)
    {
      setState((){errorString = "Email already exists";});
      return;
    }
    try
    {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseFirestore.instance.collection('users').doc(email).set(
      {
        'password': hash(password, "A3@22a"), // decoy password
        'admin': false
      });
      setState(()
      {
        errorString="";
        userEmail="";
        userPassword="";
        createAccount = false;
      });
    } catch (e)
    {
      setState(() {errorString = e.toString();});
      return;
    }
  }
}