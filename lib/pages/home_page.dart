import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  double _buttonDiameter = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          clipBehavior: Clip.none,
          children: [
            _pageBackground(),
            _circularAnimatedButton(),
          ],
        ),
    );
  }

  Widget _pageBackground() {
    return Container(
      color: Colors.orange,
    );
  }

  Widget _circularAnimatedButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _buttonDiameter += _buttonDiameter == 100 ? 100 : -100;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.bounceInOut,
          height: _buttonDiameter,
          width: _buttonDiameter,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(_buttonDiameter),
          ),
          child: const Center(
            child: Text(
              "Basic",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}