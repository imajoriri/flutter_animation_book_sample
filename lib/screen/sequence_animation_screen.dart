import 'package:flutter/material.dart';

class SequenceAnimationScreen extends StatelessWidget {
  const SequenceAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SequenceAnimationButton();
  }
}

class SequenceAnimationButton extends StatefulWidget {
  const SequenceAnimationButton({super.key});

  @override
  State<SequenceAnimationButton> createState() =>
      _SequenceAnimationButtonState();
}

class _SequenceAnimationButtonState extends State<SequenceAnimationButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // 多段階のスケールアニメーション
    _scaleAnimation = TweenSequence<double>([
      // 最初に小さく
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.0,
          end: 0.8,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1.0,
      ),
      // 次に大きく
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.8,
          end: 1.2,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1.0,
      ),
      // 最後に元のサイズに
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.2,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1.0,
      ),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TweenSequenceデモ')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: child,
                );
              },
              child: ElevatedButton(
                onPressed: _playAnimation,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
                child: const Text('タップ！', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
