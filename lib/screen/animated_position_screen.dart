import 'package:flutter/material.dart';

class AnimatedPositionScreen extends StatefulWidget {
  const AnimatedPositionScreen({super.key});

  @override
  State<AnimatedPositionScreen> createState() => _AnimatedPositionScreenState();
}

class _AnimatedPositionScreenState extends State<AnimatedPositionScreen> {
  bool _isOnRight = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('左右移動アニメーション サンプル')),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutCubic,
            left: _isOnRight ? MediaQuery.of(context).size.width - 100 : 0,
            top: MediaQuery.of(context).size.height / 2 - 50,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isOnRight = !_isOnRight;
                });
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
