import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = "progress_screen";
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress Indicators",
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'PressStart2P',
              color: Colors.green,
            )),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(children: [
        SizedBox(height: 30),
        Text(
          "Circular Progress Indicator",
          style: GameTextStyles.epicFantasy,
        ),
        SizedBox(
          height: 10,
        ),
        CircularProgressIndicator(
          strokeWidth: 2,
          backgroundColor: Colors.black,
        ),
        SizedBox(
          height: 20,
        ),
        Text("Controlled Circular/linear Indicator"),
        SizedBox(
          height: 10,
        ),
        _ControlledProgressIndicator()
      ]),
    );
  }
}

class GameTextStyles {
  static const TextStyle epicFantasy = TextStyle(
    fontFamily: 'PressStart2P',
    fontSize: 12.0,
    color: Colors.yellow,
  );
}

class GameTextStyles2 {
  static const TextStyle barbie = TextStyle(
    fontFamily: 'BarbieFont',
    fontSize: 12.0,
    color: Colors.yellow,
  );
}




class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          return (value * 2) / 100;
        }).takeWhile((value) => value < 100),
        builder: (context, snapshot) {
          final progessValue = snapshot.data ?? 0;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(value: progessValue,
                    strokeWidth: 2, backgroundColor: Colors.black45),
                const SizedBox(
                  width: 20,
                ),
                Expanded(child: LinearProgressIndicator(value: progessValue,))
              ],
            ),
          );
        });
  }
}
