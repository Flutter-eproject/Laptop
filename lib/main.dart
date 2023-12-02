import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laptop/Description_Screen.dart';
import 'package:laptop/FeedBack_Screen.dart';
import 'package:laptop/One_Time_Screen.dart';
import 'package:laptop/Profile_Firebase_Firestore/Profile_Screen.dart';
import 'package:laptop/firebase_options.dart';
import 'package:laptop/home/Home.dart';

import 'Firebase_Auth/Login_Screen.dart';
import 'Firebase_Auth/Register_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Main());
}
class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: bottomNavigation(),

    );
  }
}

class bottomNavigation extends StatefulWidget {
  const bottomNavigation({super.key});

  @override
  State<bottomNavigation> createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<bottomNavigation> {

  int selectedIndex=0;
  void pageShifter(index){
    setState(() {
      selectedIndex=index;
    });
  }

  List<Widget> myScreens=[
    HomePage(),
    HomePage(),
    HomePage(),
   HomePage()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:myScreens[selectedIndex],

        bottomNavigationBar: CurvedNavigationBar(
            index: selectedIndex,
            backgroundColor: Color(0xffffffff),
            color: Color(0xf0002525),
            onTap: pageShifter,
            items: [
              Icon(Icons.home_filled, color: selectedIndex!=0? Color(0xffffffff):
              Color(0xf0a9a9a9),),
              Icon(Icons.card_travel,color:  selectedIndex!=1? Color(0xffffffff):
              Color(0xffff4914),),
              Icon(CupertinoIcons.heart,color: selectedIndex!=2? Color(0xffffffff):
              Color(0xffff4914),),
              Icon(Icons.person_2_outlined,color:  selectedIndex!=3? Color(0xffffffff):
              Color(0xffff4914),)
            ])


    );
  }
}


