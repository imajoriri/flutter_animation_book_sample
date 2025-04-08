import 'package:flutter/material.dart';

// アニメーションさせる独自のデータ型
class PositionColorData {
  final Offset position;
  final Color color;

  PositionColorData(this.position, this.color);

  // 補間メソッド
  static PositionColorData lerp(
    PositionColorData begin,
    PositionColorData end,
    double t,
  ) {
    return PositionColorData(
      Offset.lerp(begin.position, end.position, t)!,
      Color.lerp(begin.color, end.color, t)!,
    );
  }
}

// カスタムTween
class PositionColorTween extends Tween<PositionColorData> {
  PositionColorTween({
    required PositionColorData begin,
    required PositionColorData end,
  }) : super(begin: begin, end: end);

  @override
  PositionColorData lerp(double t) {
    return PositionColorData.lerp(begin!, end!, t);
  }
}

class CustomTweenScreen extends StatelessWidget {
  const CustomTweenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CustomTweenDemo());
  }
}

class CustomTweenDemo extends StatefulWidget {
  const CustomTweenDemo({super.key});

  @override
  State<CustomTweenDemo> createState() => _CustomTweenDemoState();
}

class _CustomTweenDemoState extends State<CustomTweenDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<PositionColorData> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _animation = PositionColorTween(
      begin: PositionColorData(const Offset(0, 0), Colors.blue),
      end: PositionColorData(const Offset(200, 300), Colors.red),
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
      appBar: AppBar(title: const Text('カスタムTweenデモ')),
      body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Stack(
                children: [
                  Positioned(
                    left: _animation.value.position.dx,
                    top: _animation.value.position.dy,
                    child: GestureDetector(
                      onTap: () {
                        if (_controller.isAnimating) {
                          _controller.stop();
                        } else {
                          _controller.repeat(reverse: true);
                        }
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        color: _animation.value.color,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
