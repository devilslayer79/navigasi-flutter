import 'package:flutter/material.dart';
import 'package:tugas_2/Logout.dart';
import 'package:tugas_2/HomePage.dart';
import 'package:tugas_2/About.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  int selectedIndex = 0;

 
  final widgetOptions = [
    const HomePage(),
    const About(),
    const Logout(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final widgetTitle = ["Home", "About", "Logout"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Home"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Logout(),
                  ),
                );
              },
            ),
            const ListTile(
              title: Text("About"),
            ),
            const ListTile(
              title: Text("Logout"),
            ),
          ],
        ),
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.messenger,
                color: Colors.blue,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.stacked_line_chart_outlined,
                color: Colors.blue,
              ),
              label: "About"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.call,
                color: Colors.blue,
              ),
              label: "Logout"),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.blue,
        onTap: onItemTapped,
        selectedIconTheme: const IconThemeData(color: Colors.blue, size: 30.0),
        unselectedItemColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.message),
      ),
    );
  }
}
