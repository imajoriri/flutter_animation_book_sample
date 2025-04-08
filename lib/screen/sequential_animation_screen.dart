import 'package:flutter/material.dart';

class SequentialAnimationScreen extends StatefulWidget {
  const SequentialAnimationScreen({super.key});

  @override
  State<SequentialAnimationScreen> createState() =>
      _SequentialAnimationScreenState();
}

class _SequentialAnimationScreenState extends State<SequentialAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // 最初の1/3で実行されるアニメーション
    _animation1 = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
    );

    // 次の1/3で実行されるアニメーション
    _animation2 = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 0.6, curve: Curves.elasticInOut),
    );

    // 最後の1/3で実行されるアニメーション
    _animation3 = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.6, 1.0, curve: Curves.bounceOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('順次アニメーションのサンプル')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 各アニメーションを使ったウィジェット
            AnimatedBuilder(
              animation: _animation1,
              builder: (context, child) {
                return Container(
                  width: 100 + 200 * _animation1.value,
                  height: 50,
                  color: Colors.red,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                );
              },
            ),
            AnimatedBuilder(
              animation: _animation2,
              builder: (context, child) {
                return Container(
                  width: 100 + 200 * _animation2.value,
                  height: 50,
                  color: Colors.green,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                );
              },
            ),
            AnimatedBuilder(
              animation: _animation3,
              builder: (context, child) {
                return Container(
                  width: 100 + 200 * _animation3.value,
                  height: 50,
                  color: Colors.blue,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                );
              },
            ),

            // アニメーション制御ボタン
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (_controller.status == AnimationStatus.completed) {
                  _controller.reset();
                  _controller.forward();
                } else {
                  _controller.forward();
                }
              },
              child: const Text('アニメーション実行'),
            ),
          ],
        ),
      ),
    );
  }
}
