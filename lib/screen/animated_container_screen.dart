import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatelessWidget {
  const AnimatedContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedContainerのサンプル')),
      body: const ContainerExample(),
    );
  }
}

class ContainerExample extends StatefulWidget {
  const ContainerExample({super.key});

  @override
  State<ContainerExample> createState() => _ContainerExampleState();
}

class _ContainerExampleState extends State<ContainerExample> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            // アニメーションの設定
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,

            // 変化するプロパティ
            width: _expanded ? 300.0 : 200.0,
            height: _expanded ? 200.0 : 100.0,
            padding:
                _expanded
                    ? const EdgeInsets.all(20.0)
                    : const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: _expanded ? Colors.blue : Colors.green,
              borderRadius: BorderRadius.circular(_expanded ? 20.0 : 8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(20),
                  blurRadius: _expanded ? 10.0 : 5.0,
                  offset: Offset(0, _expanded ? 8.0 : 3.0),
                ),
              ],
            ),

            // コンテンツ
            child: Center(
              child: Text(
                _expanded ? '縮小する' : '拡大する',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: _expanded ? 22.0 : 16.0,
                  fontWeight: _expanded ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
            child: Text(_expanded ? '縮小' : '拡大'),
          ),
        ],
      ),
    );
  }
}
