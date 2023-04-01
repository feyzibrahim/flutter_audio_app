// import 'package:audio_app/onlinePage.dart';
import 'package:flutter/material.dart';
import 'package:audio_app/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // int _pageIndex = 0;
  // PageController _pageController;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Audio App",
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Home(),
        
        // PageView(
        //   children: [
        //     Home(),
        //     OnlinePage(),
        //   ],
        //   onPageChanged: onPageChanged,
        //   controller: _pageController,
        // ),
        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: _pageIndex,
        //   onTap: onTabTapped,
        //   backgroundColor: Colors.grey[900],
        //   selectedItemColor: Colors.white,
        //   unselectedItemColor: Colors.grey,
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: 'Offline',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.search),
        //       label: 'Search Online',
        //     ),
        //   ],
        // ),
      ),
    );
  }

  // void onPageChanged(int page) {
  //   setState(() {
  //     this._pageIndex = page;
  //   });
  // }

  // void onTabTapped(int index) {
  //   this._pageController.animateToPage(
  //         index,
  //         duration: Duration(milliseconds: 500),
  //         curve: Curves.easeInOutQuad,
  //       );
  // }
}
