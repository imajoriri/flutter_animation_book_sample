import 'package:flutter/material.dart';

class ScaleAnimationControllerScreen extends StatefulWidget {
  const ScaleAnimationControllerScreen({super.key});

  @override
  State<ScaleAnimationControllerScreen> createState() =>
      _ScaleAnimationControllerScreenState();
}

class _ScaleAnimationControllerScreenState
    extends State<ScaleAnimationControllerScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    // AnimationControllerの初期化
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..addListener(() {
      setState(() {
        // コントローラーの値を直接不透明度として使用
        _opacity = _controller.value;
      });
    });

    // デフォルトで表示状態から始める
    _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('手動フェードアニメーション サンプル')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            // アニメーションの開始・逆再生を切り替える
            if (_controller.status == AnimationStatus.completed) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          child: Opacity(
            opacity: _opacity,
            child: Container(width: 200.0, height: 200.0, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
