import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/models/smart_devices.dart';
import '../utilities/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Power button switched.
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      SmartDevices.mySmartDevices()[index].powerStatus = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final double horizontalPadding = screenHeight * 0.045; // 40
    final double verticalPadding = screenHeight * 0.03; // 25

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom app bar.
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Menu icon.
                  InkWell(
                    onTap: () {},
                    splashColor: Colors.white10,
                    child: Image.asset(
                      'lib/icons/menu.png',
                      height: screenHeight * 0.04,
                      color: Colors.grey[800],
                    ),
                  ),
                  // Account icon.
                  IconButton(
                    icon: const Icon(Icons.person),
                    iconSize: screenHeight * 0.04,
                    color: Colors.grey[800],
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            // Welcome home part.
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Home,",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).textScaleFactor * 20,
                      color: const Color.fromRGBO(97, 97, 97, 1)
                    ),
                  ),
                  Text(
                    "DENIZ GOKAY",
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: MediaQuery.of(context).textScaleFactor * 50,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const Divider(
                color: Color.fromRGBO(189, 189, 189, 1),
                thickness: 1,
              ),
            ),
            
            const SizedBox(height: 25),
            // Smart devices + grid.
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding
              ),
              child: Text(
                "Smart Devices",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).textScaleFactor * 24,
                  color: const Color.fromRGBO(66, 66, 66, 1),
                ),
              ),
            ),

            Expanded(
              child: GridView.builder(
                itemCount: SmartDevices.mySmartDevices().length,
                padding: EdgeInsets.all(screenHeight * 0.03),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: SmartDevices.mySmartDevices()[index].deviceName!,
                    iconPath: SmartDevices.mySmartDevices()[index].iconPath!,
                    powerOn: SmartDevices.mySmartDevices()[index].powerStatus!,
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}