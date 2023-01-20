import 'package:cflutter4/pages/cart_page.dart';
import 'package:cflutter4/pages/favorite_page.dart';
import 'package:cflutter4/pages/home_page.dart';
import 'package:cflutter4/pages/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:cflutter4/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static const List<Widget> pageList = <Widget>[
    HomePage(),
    MenuPage(),
    FavoritePage(),
    CartPage(),
  ];

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppConstant.black1,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppConstant.black3,
        selectedItemColor: AppConstant.lightOrange,
        unselectedItemColor: Colors.white54,
        elevation: 4,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: MainPage.pageList[selectedIndex],
    );
  }
}
