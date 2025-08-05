import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'initializeFirebase.dart'; // excluded on gitignore
import 'util.dart';
import 'sidebar.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await initializeFirebase();
  await signInAnonymously();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Website',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 26, 9, 56)),
      ),
      home: const MyHomePage(title: 'Portfolio Website'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  /*void initState()
  {
    super.initState();
  }*/
  @override
  Widget build(BuildContext context) {
    MediaHolder mh = MediaHolder(projectName: "Don't meth >:(", description: "drugs bad");
    Widget w = mh.getWidgetQuickLoad();
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),*/
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
                  Padding
                  (
                    padding: EdgeInsets.all(8.0),
                    child: Text
                    (
                      "Intro",
                      style: TextStyle
                      (
                        fontSize: 28
                      ),
                    ),
                  ),
                  Padding
                  (
                    padding: EdgeInsets.all(8.0),
                    child: Text
                    (
                      "      Hello and welcome to my website. This is the 2nd iteration of my portfolio website. "
                      "This iteration is written using flutter and deployed using firebase. Fixing my website was on my list of things to do for a while and I found a better deployment. "
                      "The first element from the left column should be a button that leads to a list of some of the projects I worked on. "
                      "I am currently a software developer without a job working on getting another degree in a masters program to try to get into the workforce. "
                      "If you want to contact me or have any questions please contact me through my email(spencer.d.williams123@gmail.com). "                   
                      ,
                      style: TextStyle
                      (
                        fontSize: 24
                      ),
                    ),
                  ),
                  w
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
