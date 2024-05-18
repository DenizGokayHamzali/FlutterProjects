import 'package:flutter/material.dart';
import 'package:flutter_web_ui/Screens/Home/Components/app_bar.dart';

import 'Components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen.
    return Scaffold(
      body: Container(
        height: size.height,
        // It will take full height.
        width: size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/burgerybackground.png"),
              fit: BoxFit.cover,
            ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            CustomAppBar(),
            Spacer(),
            Body(),
            Spacer(
                flex: 2
            ),
          ],
        ),
      ),
    );
  }
}
