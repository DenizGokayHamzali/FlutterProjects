import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatefulWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  final Function(bool)? onChanged;


  const SmartDeviceBox({
    Key? key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerOn,
    this.onChanged,
  }) : super(key: key);

  @override
  State<SmartDeviceBox> createState() => _SmartDeviceBoxState();
}

class _SmartDeviceBoxState extends State<SmartDeviceBox> {
  bool _powerOn = false; // Underscore for private names.

  @override
  void initState() {
    super.initState();
    _powerOn = widget.powerOn;
  }


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final double horizontalPadding = screenHeight * 0.045; // 40
    final double verticalPadding = screenHeight * 0.03; // 25

    return Padding(
      padding: EdgeInsets.all(screenHeight * 0.017),
      child: Container(
        decoration: BoxDecoration(
          color: _powerOn ? Colors.grey[900] : Colors.grey[200],
          borderRadius: BorderRadius.circular(screenHeight * 0.03),
        ),
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Icon.
            Image.asset(
              widget.iconPath,
              height: screenHeight * 0.075,
              color: _powerOn ? Colors.white : Colors.black,
            ),
            // Smart device name + switch.
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: screenHeight * 0.017),
                    child: Text(
                      widget.smartDeviceName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: _powerOn ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: pi / 2,
                  child: CupertinoSwitch(
                    value: _powerOn,
                    onChanged: (value) => setState(() => _powerOn = value)
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

