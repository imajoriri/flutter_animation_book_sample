import 'package:flutter/material.dart';

class AnimatedScaleScreen extends StatelessWidget {
  const AnimatedScaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedScale サンプル')),
      body: const Center(child: ScaleExample()),
    );
  }
}

class ScaleExample extends StatefulWidget {
  const ScaleExample({Key? key}) : super(key: key);

  @override
  State<ScaleExample> createState() => _ScaleExampleState();
}

class _ScaleExampleState extends State<ScaleExample> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedScale(
            scale: _scale,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _scale = 0.5; // 半分のサイズ
                  });
                },
                child: const Text('縮小'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _scale = 1.0; // 元のサイズ
                  });
                },
                child: const Text('元に戻す'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _scale = 1.5; // 1.5倍のサイズ
                  });
                },
                child: const Text('拡大'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // バウンス効果のデモ用ボタン
          GestureDetector(
            onTapDown: (_) {
              setState(() {
                _scale = 0.9; // タップ時に少し縮小
              });
            },
            onTapUp: (_) {
              setState(() {
                _scale = 1.0; // 離した時に元のサイズに戻る
              });
            },
            onTapCancel: () {
              setState(() {
                _scale = 1.0; // キャンセル時も元のサイズに戻る
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'タップでバウンス効果',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
