import 'package:flutter/material.dart';

class AnimatedRotationScreen extends StatelessWidget {
  const AnimatedRotationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedRotation サンプル')),
      body: const Center(child: RotationExample()),
    );
  }
}

class RotationExample extends StatefulWidget {
  const RotationExample({Key? key}) : super(key: key);

  @override
  State<RotationExample> createState() => _RotationExampleState();
}

class _RotationExampleState extends State<RotationExample> {
  double _rotationAngle = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedRotation(
            turns: _rotationAngle, // 回転角度をターン（1周=1.0）で指定
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(Icons.arrow_upward, color: Colors.white, size: 60),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // 右に90度（0.25ターン）回転
                    _rotationAngle += 0.25;
                  });
                },
                child: const Text('右に90度回転'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // 左に90度（0.25ターン）回転
                    _rotationAngle -= 0.25;
                  });
                },
                child: const Text('左に90度回転'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {
                // 回転をリセット
                _rotationAngle = 0.0;
              });
            },
            child: const Text('リセット'),
          ),
        ],
      ),
    );
  }
}
