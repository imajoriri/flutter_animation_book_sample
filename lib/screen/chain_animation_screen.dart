import 'package:flutter/material.dart';

class ChainAnimationScreen extends StatelessWidget {
  const ChainAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChainAnimationDemo();
  }
}

class ChainAnimationDemo extends StatefulWidget {
  const ChainAnimationDemo({super.key});

  @override
  State<ChainAnimationDemo> createState() => _ChainAnimationDemoState();
}

class _ChainAnimationDemoState extends State<ChainAnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // サイズアニメーション（100→200）
    _sizeAnimation = Tween<double>(
      begin: 100.0,
      end: 200.0,
    ).chain(CurveTween(curve: Curves.easeOutExpo)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chain Animationデモ')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (_controller.status == AnimationStatus.completed) {
                  _controller.reverse();
                } else {
                  _controller.forward();
                }
              },
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Container(
                    width: _sizeAnimation.value,
                    height: _sizeAnimation.value,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
