import 'package:banner/banner.dart';
import 'package:flutter/material.dart';
import 'package:kpi/kpi.dart';
import 'package:must_do_actions/must_do_actions.dart';
import 'package:salescode_sdk/salescode_sdk.dart';

import '../faq/screen/faq_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    index == 2
        ? 
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => FAQScreen()),
        //   )
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FaqScreen()),
          )
        : null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Channelkart',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w600
        ),),
        backgroundColor: GlobalVariables.themeColor,
        automaticallyImplyLeading: false,
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppSchemeBanner(bannerList: [], bannerId: "use template"),
          Buckets(bucketId: "StoreBannerTest001"),
          MustDoActions(),
          KpiTiles(),
          // FAQButton()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: 'FAQs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: GlobalVariables.themeColor,
        unselectedItemColor: Colors.grey,
        onTap: onItemTapped,
      ),
    );
  }
}
