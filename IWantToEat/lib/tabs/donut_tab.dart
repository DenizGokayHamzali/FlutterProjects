import 'package:flutter/material.dart';

import '../utilities/donut_tile.dart';

class DonutTab extends StatelessWidget {
  const DonutTab({Key? key}) : super(key: key);

  // This is constant constructor, static final for symbolic.
  static final List donutsOnSale = [
    // [donutFlavor, donutPrice, donutColor, imageName]
    ["Ice Cream", "36", Colors.blue, "assets/images/ice_cream_donut.png"],
    ["Strawberry", "45", Colors.red, "assets/images/strawberry_donut.png"],
    ["Grape Ape", "84", Colors.purple, "assets/images/grape_donut.png"],
    ["Chocolate", "95", Colors.brown, "assets/images/chocolate_donut.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: donutsOnSale.length,
      padding: const EdgeInsets.all(12.0),
      gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.5,
        ),
      itemBuilder: (context, index) {
        return DonutTile(
          donutFlavor: donutsOnSale[index][0],
          donutPrice: donutsOnSale[index][1],
          donutColor: donutsOnSale[index][2],
          imageName: donutsOnSale[index][3]
        );
      },
    );
  }
}
