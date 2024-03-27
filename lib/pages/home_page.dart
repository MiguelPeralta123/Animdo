import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  double _buttonDiameter = 100;
  final Tween<double> _backgroundScale = Tween<double>(begin: 0.0, end: 1.0);
  late AnimationController _starIconAnimationController;

  @override
  void initState() {
    super.initState();
    // The "with SingleTickerProviderStateMixin" allows to initialize the animation controller
    _starIconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _starIconAnimationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          clipBehavior: Clip.none,
          children: [
            _pageBackground(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _circularAnimatedButton(),
                _starAnimatedIcon(),
              ],
            ),
          ],
        ),
    );
  }

  Widget _pageBackground() {
    return TweenAnimationBuilder(
      tween: _backgroundScale,
      curve: Curves.easeInOutCubicEmphasized,
      duration: const Duration(seconds: 1),
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      child: Container(
        color: Colors.orange,
      ),
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

  Widget _starAnimatedIcon() {
    return AnimatedBuilder(
      animation: _starIconAnimationController.view,
      builder: (context, child) {
        return Transform.rotate(
          angle: _starIconAnimationController.value * 2 * pi,
          child: child,
        );
      },
      child: const Icon(
        Icons.star,
        size: 100,
        color: Colors.white,
      ),
    );
  }
}