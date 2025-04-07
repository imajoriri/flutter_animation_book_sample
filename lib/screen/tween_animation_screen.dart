import 'package:flutter/material.dart';

class TweenAnimationScreen extends StatelessWidget {
  const TweenAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tween アニメーション')),
      body: const Center(child: TweenExample()),
    );
  }
}

class TweenExample extends StatefulWidget {
  const TweenExample({super.key});

  @override
  State<TweenExample> createState() => _TweenExampleState();
}

class _TweenExampleState extends State<TweenExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // AnimationControllerの初期化（1秒間のアニメーション）
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // ColorTweenの作成（青から赤へ変化）
    final colorTween = ColorTween(begin: Colors.blue, end: Colors.red);
    _colorAnimation = colorTween.animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
            width: 100,
            height: 100,
            color: _colorAnimation.value,
          );
        },
      ),
    );
  }
}
