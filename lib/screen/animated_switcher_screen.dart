import 'package:flutter/material.dart';

class AnimatedSwitcherScreen extends StatelessWidget {
  const AnimatedSwitcherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedSwitcher サンプル')),
      body: const Center(child: SwitcherExample()),
    );
  }
}

class SwitcherExample extends StatefulWidget {
  const SwitcherExample({Key? key}) : super(key: key);

  @override
  State<SwitcherExample> createState() => _SwitcherExampleState();
}

class _SwitcherExampleState extends State<SwitcherExample> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(
              scale: animation,
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          child: Text(
            '$_count',
            // キーが変更されると、AnimatedSwitcherはトランジションをトリガー
            key: ValueKey<int>(_count),
            style: const TextStyle(fontSize: 50.0),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _count -= 1;
                });
              },
              child: const Text('減らす'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
              child: const Text('増やす'),
            ),
          ],
        ),
      ],
    );
  }
}
