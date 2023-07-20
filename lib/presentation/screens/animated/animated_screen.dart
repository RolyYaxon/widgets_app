import 'package:flutter/material.dart';
import 'dart:math';

import 'package:widgets_app/presentation/screens/progress/progress_screen.dart';

class AnimatedScreen extends StatefulWidget {
  static const name = "animated_screen";
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape() {
    final random = Random();

    width = random.nextInt(300) + 15;
    height = random.nextInt(500) + 5;
    borderRadius = random.nextInt(100) + 10.0;
    color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Full Animations",style: GameTextStyles2.barbie,),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          width: width <= 0 ? 0: width,
          height: height <=0 ? 0:width,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(borderRadius < 0 ? 0:borderRadius)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeShape();
        },
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
