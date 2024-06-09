import 'package:flutter/material.dart';

import '../utilities/my_tab.dart';

import '../tabs/donut_tab.dart';
import '../tabs/burger_tab.dart';
import '../tabs/smoothie_tab.dart';
import '../tabs/pancake_tab.dart';
import '../tabs/pizza_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Widget> myTabs = [

    const MyTab(
      iconPath: 'assets/icons/donut.png',
    ),

    const MyTab(
      iconPath: 'assets/icons/burger.png',
    ),

    const MyTab(
      iconPath: 'assets/icons/smoothie.png',
    ),

    const MyTab(
      iconPath: 'assets/icons/pancakes.png',
    ),

    const MyTab(
      iconPath: 'assets/icons/pizza.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.grey[800],
                size: 36,
              ), onPressed: () {
                // Making open drawer.
            },
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.grey[800],
                  size: 36,
                ), onPressed: () {
                // Making account button tapped.
              },
              ),
            ),
          ],
        ),
        body: Column(
          children: [
          // I want to eat part.
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.0, vertical: 9.0),
            child: Row(
              children: [
                Text(
                  'I want to ',
                  style: TextStyle(fontSize: 24),
                ),

                Text(
                  'EAT',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Tab bar part.
          // It did child to Scaffold for DefaultTabController.
          TabBar(tabs: myTabs),

          // Tab bar view part.
          // We started with expanded for expand the whole line.
          const Expanded(
            child: TabBarView(
              children: [
                DonutTab(),

                BurgerTab(),

                SmoothieTab(),

                PancakeTab(),

                PizzaTab(),

              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}
