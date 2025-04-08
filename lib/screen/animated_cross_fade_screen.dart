import 'package:flutter/material.dart';

class AnimatedCrossFadeScreen extends StatelessWidget {
  const AnimatedCrossFadeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedCrossFade サンプル')),
      body: const Center(child: CrossFadeExample()),
    );
  }
}

class CrossFadeExample extends StatefulWidget {
  const CrossFadeExample({Key? key}) : super(key: key);

  @override
  State<CrossFadeExample> createState() => _CrossFadeExampleState();
}

class _CrossFadeExampleState extends State<CrossFadeExample> {
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 500),
          firstChild: Container(width: 200, height: 100, color: Colors.blue),
          secondChild: Container(width: 200, height: 200, color: Colors.red),
          crossFadeState:
              _showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          // サイズが異なる場合のアニメーション方法
          sizeCurve: Curves.easeInOut,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _showFirst = !_showFirst;
            });
          },
          child: Text(_showFirst ? '2番目を表示' : '最初を表示'),
        ),
      ],
    );
  }
}
