import 'package:flutter/material.dart';

// カスタムアニメーションウィジェット
class ColorTransition extends AnimatedWidget {
  // コンストラクタでAnimationを受け取り、それをsuperに渡す
  const ColorTransition({
    Key? key,
    required Animation<Color?> color,
    required this.child,
  }) : super(key: key, listenable: color);

  // 子ウィジェット
  final Widget child;

  // listenerをAnimation<Color?>として取得するためのgetter
  Animation<Color?> get color => listenable as Animation<Color?>;

  @override
  Widget build(BuildContext context) {
    // color.valueでアニメーションの現在値を取得
    return Container(color: color.value ?? Colors.transparent, child: child);
  }
}

class ColorTransitionScreen extends StatefulWidget {
  const ColorTransitionScreen({super.key});

  @override
  State<ColorTransitionScreen> createState() => _ColorTransitionScreenState();
}

class _ColorTransitionScreenState extends State<ColorTransitionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // 色のアニメーションを定義
    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('カラートランジションのサンプル')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorTransition(
              color: _colorAnimation,
              child: const SizedBox(width: 200, height: 200),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_controller.status == AnimationStatus.completed) {
                  _controller.reverse();
                } else {
                  _controller.forward();
                }
              },
              child: const Text('アニメーション開始'),
            ),
          ],
        ),
      ),
    );
  }
}
