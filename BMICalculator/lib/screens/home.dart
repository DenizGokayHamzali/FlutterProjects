import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/constants/app_constants.dart';

import '../widgets/left_bar.dart';
import '../widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            color: accentColor,
            fontWeight: FontWeight.w300
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                 width: 130,
                 child:  TextField(
                   controller: _heightController,
                   style: const TextStyle(
                     fontSize: 42,
                     fontWeight: FontWeight.w300,
                     color: accentColor,
                   ),
                   keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                     border: InputBorder.none,
                     hintText: "Height",
                     hintStyle: TextStyle(
                       fontSize: 42,
                       fontWeight: FontWeight.w300,
                         color: Colors.white.withOpacity(.8)
                     ),
                   ),
                 ),
                ),
                Container(
                  width: 130,
                  child:  TextField(
                    controller: _weightController,
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8)
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),

            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = (_w / (_h * _h));
                  if(_bmiResult > 30) {
                    _textResult = "You have obesity :'(";
                  } else if(_bmiResult > 25 && _bmiResult <= 29.9) {
                    _textResult = "You\'re overweight :(";
                  } else if(_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = "You have normal weight :)";
                  } else {
                    _textResult = "You have underweight :(";
                  }
                });
              },
              child: const Text(
                "Calculate",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: accentColor,
                ),
              ),
            ),
            const SizedBox(height: 50,),
            Text(
              _bmiResult.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 90,
                color: accentColor,
              ),
            ),
            const SizedBox(height: 20,),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Text(
                _textResult,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                color: accentColor),
              ),
            ),
            const SizedBox(height: 20,),
            const RightBar(barWidth: 40,),
            const SizedBox(height: 20,),
            const RightBar(barWidth: 70,),
            const SizedBox(height: 20,),
            const RightBar(barWidth: 40,),
            const SizedBox(height: 20,),
            const LeftBar(barWidth: 70,),
            const SizedBox(height: 30,),
            const LeftBar(barWidth: 70,),
          ],
        ),
      ),
    );
  }
}
