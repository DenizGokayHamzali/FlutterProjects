import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  final donutColor;
  final String imageName;

  static const double borderRadius = 12.0;
  static const double padding = 12.0;

  const DonutTile({
    Key? key,
    required this.donutFlavor,
    required this.donutPrice,
    required this.donutColor,
    required this.imageName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        decoration: BoxDecoration(
          color: donutColor[50],
          borderRadius: BorderRadius.circular(borderRadius)
        ),
        child: Column(
          children: [
            // Price part.
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: donutColor[100],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(borderRadius),
                      topRight: Radius.circular(borderRadius),
                    ),
                  ),
                  padding: const EdgeInsets.all(padding),
                  child: Text(
                    '\$$donutPrice', // '\$' + donutPrice
                    style: TextStyle(
                      color: donutColor[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),

            // Donut picture.
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 36.0,
                vertical: 16
              ),
              child: Image.asset(imageName),
            ),

            Text(
              donutFlavor,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Dunkins',
              style: TextStyle(color: Colors.grey[600]),
            ),
            // Love icon + add button.
            Padding(
              padding: const EdgeInsets.only(
                top: 2.0,
                bottom: 2.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Love icon.
                  IconButton(
                    onPressed: () {  },
                    icon: const Icon(
                      Icons.favorite
                    ),
                      color: Colors.pink[400],
                  ),

                  // Add button.
                  IconButton(
                    onPressed: () {  },
                    icon: const Icon(
                      Icons.add
                    ),
                      color: Colors.grey[800],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
