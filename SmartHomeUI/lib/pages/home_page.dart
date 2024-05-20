import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/models/smart_devices.dart';
import '../utilities/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Padding constants for dev speed.
  static const double horizontalPadding = 40;
  static const double verticalPadding = 25;

  // Power button switched.
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      SmartDevices.mySmartDevices()[index].powerStatus = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom app bar.
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Menu icon.
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  // Account icon.
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            // Welcome home part.
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome Home,",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(97, 97, 97, 1)
                    ),
                  ),
                  Text(
                    "DENIZ GOKAY",
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 72,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),
            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(
                color: Color.fromRGBO(189, 189, 189, 1),
                thickness: 1,
              ),
            ),
            
            const SizedBox(height: 25),
            // Smart devices + grid.
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding
              ),
              child: Text(
                "Smart Devices",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromRGBO(66, 66, 66, 1),
                ),
              ),
            ),

            Expanded(
              child: GridView.builder(
                itemCount: SmartDevices.mySmartDevices().length,
                padding: const EdgeInsets.all(25.0),
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