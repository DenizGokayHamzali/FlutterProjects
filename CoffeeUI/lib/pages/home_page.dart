import 'package:flutter/material.dart';
import 'package:flutter_coffee_ui/utilities/coffee_type.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/coffee_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // List of coffee types. Nested list.
  final List coffeeTypes = [
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];

  // User tapped on coffee types.
  void coffeeTypeSelected(int index) {
    // This for loop makes every selection false.
      for (int i = 0; i < coffeeTypes.length; i++) {
        coffeeTypes[i][1] = false;
      }
    setState(() {
      coffeeTypes[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
          ), onPressed: () {
          // Making open drawer.
        },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: const Icon(
                Icons.person,
              ), onPressed: () {
              // Making account button tapped.
            },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: ''
          ),
        ],
      ),
      body: Column(
        children: [
          // I want to eat part.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                      "Find the best coffee for you!",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 56,
                      ),
                    ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your dream coffee...',
                focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(117, 117, 117, 1)),
                ),

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(117, 117, 117, 1)),
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Horizontal listview of coffee types.
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeTypes.length,
              itemBuilder: (BuildContext context, int index) {
                return CoffeeType(
                  coffeeType: coffeeTypes[index][0],
                  isSelected: coffeeTypes[index][1],
                  onTap: () {
                    coffeeTypeSelected(index);
                  },
                );
              },

            ),
          ),

          // Horizontal listview of coffee tiles.
          Expanded(
            child: ListView.builder(
              itemCount: 1, // If this would not be 1, it shows infinite loops.
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return const Row(
                  children: [
                    CoffeeTile(
                      coffeeImagePath: 'assets/images/cappuccino.jpg',
                      coffeeName: 'Cappuccino',
                      coffeePrice: '4.00',
                    ),
                    CoffeeTile(
                      coffeeImagePath: 'assets/images/ice_coffee.jpg',
                      coffeeName: 'Ice Coffee',
                      coffeePrice: '4.40',
                    ),
                    CoffeeTile(
                      coffeeImagePath: 'assets/images/latte.jpg',
                      coffeeName: 'Latte',
                      coffeePrice: '4.30',
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
