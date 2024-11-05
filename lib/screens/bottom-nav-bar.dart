import 'package:contacts_app/provider/ui-provider/bottom-nav-provider.dart';
import 'package:contacts_app/screens/favorites-screen.dart';
import 'package:contacts_app/screens/home-screen.dart';
import 'package:contacts_app/utils/app-color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
   BottomNavBar({super.key});

  final pages = [
    HomeScreen(),
    FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Consumer<BottomNavProvider>(builder: (context, bNavProvider, child) {
        return BottomNavigationBar(
          onTap: (value) => bNavProvider.setIndex(value),
          currentIndex: bNavProvider.currentIndex,
          backgroundColor: appcolor.backgroundColor,
          selectedItemColor: appcolor.primaryColor,
          unselectedItemColor: appcolor.teritiaryColor,
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "")
      ]);
      },),
      body: Consumer<BottomNavProvider>(builder: (context, bNavProvider, child) {
        return pages[bNavProvider.currentIndex];
      },),
    );
  }
}