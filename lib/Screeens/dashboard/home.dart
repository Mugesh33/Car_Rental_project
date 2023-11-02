import 'package:car_rental_project/Screeens/utils/helper/shared_preference.dart';
import 'package:flutter/material.dart';

import '../sign_in/sign_in.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void _onDrawerItemClicked(String itemName) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.pink,
            Colors.black,
          ]),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink, Colors.black],
                ),
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => _onDrawerItemClicked('Home'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => _onDrawerItemClicked('Settings'),
            ),
            ListTile(
              leading: const Icon(Icons.date_range),
              title: const Text('My Booking'),
              onTap: () => _onDrawerItemClicked('My Booking'),
            ),
            ListTile(
              leading: const Icon(Icons.help_outline_outlined),
              title: const Text('Help&Support'),
              onTap: () => _onDrawerItemClicked('Help&Support'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => _onDrawerItemClicked('Settings'),
            ),
            ListTile(
                leading: const Icon(Icons.logout_sharp),
                title: const Text('Logout'),
                onTap: () {
                  _logout();
                }),
          ],
        ),
      ),
    );
  }

  Future<String?> _logout() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Do you want logout?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).
              pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginPage()));
              setEmail('');
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
