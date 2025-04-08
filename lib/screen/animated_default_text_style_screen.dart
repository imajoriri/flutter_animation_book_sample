import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleScreen extends StatelessWidget {
  const AnimatedDefaultTextStyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedDefaultTextStyle サンプル')),
      body: const Center(child: DefaultTextStyleExample()),
    );
  }
}

class DefaultTextStyleExample extends StatefulWidget {
  const DefaultTextStyleExample({Key? key}) : super(key: key);

  @override
  State<DefaultTextStyleExample> createState() =>
      _DefaultTextStyleExampleState();
}

class _DefaultTextStyleExampleState extends State<DefaultTextStyleExample> {
  bool _isLarge = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedDefaultTextStyle(
            // テキストスタイルを変更
            style: TextStyle(
              fontSize: _isLarge ? 22.0 : 16.0,
              fontWeight: _isLarge ? FontWeight.bold : FontWeight.normal,
              color: _isLarge ? Colors.blue : Colors.black,
              letterSpacing: _isLarge ? 1.2 : 1.0,
            ),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: const Text('アニメーションするテキスト'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isLarge = !_isLarge;
              });
            },
            child: Text(_isLarge ? '小さいスタイルに変更' : '大きいスタイルに変更'),
          ),
        ],
      ),
    );
  }
}
