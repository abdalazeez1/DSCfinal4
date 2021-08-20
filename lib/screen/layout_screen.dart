import 'package:dsc_final4/screen/home_screen.dart';
import 'package:dsc_final4/screen/searsh.dart';
import 'package:dsc_final4/screen/shopping_screen.dart';
import 'package:dsc_final4/screen/sign_screen.dart';
import 'package:dsc_final4/screen/wishlist_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;
  List<Widget> screens = [HomeScreen(), ShoppingScreen(), WishListScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                child: Container(
                  width: double.infinity,
                  color: Colors.black12,
                  child: Center(
                    child: Text(
                      'DSC shop ',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text('sign out'),
                leading: IconButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => SignScreen()));
                    },
                    icon: Icon(Icons.exit_to_app)),
              ),
            ],
          ),
        ),
        appBar: buildAppBar(context),
        bottomNavigationBar: buildBottomNavigationBar(),
        body: screens[currentIndex]);
  }





  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'dsad'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: 'dsad'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'dsad'),
        ],
        currentIndex: currentIndex,
        onTap: (val) {
          setState(() {
            currentIndex = val;
          });
        },
      );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('shop DSC'),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pop(MaterialPageRoute(builder: (_) => SearchScreen()));
            },
            icon: Icon(Icons.search))
      ],
    );
  }
}
