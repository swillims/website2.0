import 'package:flutter/material.dart';
import 'main.dart';

import 'login.dart';
import 'admin.dart';

class Sidebar extends StatelessWidget 
{
  const Sidebar({super.key}); 
  @override
  Widget build(BuildContext context)
  {
    return Container
    (
      width: MediaQuery.of(context).size.width * 0.15,
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: Column
      (
        children:
        [
          TextButton
          (
            child: Text
            (
              "Home",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: (){
              //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MyApp()),);
              Navigator.pushReplacement(
                context,PageRouteBuilder(pageBuilder: (context, animation1, animation2) => 
                MyApp(),transitionDuration: Duration.zero,reverseTransitionDuration: Duration.zero,),);
              },
          ),
          TextButton
          (
            child: Text
            (
              "bbbb",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: (){},
          ),
          TextButton
          (
            child: Text
            (
              "ccc",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: (){},
          ),
          TextButton
          (
            child: Text
            (
              "Login/Logout",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: (){
              Navigator.pushReplacement(
                context,PageRouteBuilder(pageBuilder: (context, animation1, animation2) => 
                Login(),transitionDuration: Duration.zero,reverseTransitionDuration: Duration.zero,),);
            },
          ),
          TextButton
          (
            child: Text
            (
              "Admin",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: (){
              //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Admin()),);},
              Navigator.pushReplacement(
                context,PageRouteBuilder(pageBuilder: (context, animation1, animation2) => 
                Admin(),transitionDuration: Duration.zero,reverseTransitionDuration: Duration.zero,),);
              },
          ),
        ],
      )
    );
  }
}