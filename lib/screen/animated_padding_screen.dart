import 'package:flutter/material.dart';

class AnimatedPaddingScreen extends StatelessWidget {
  const AnimatedPaddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedPadding サンプル')),
      body: const Center(child: PaddingExample()),
    );
  }
}

class PaddingExample extends StatefulWidget {
  const PaddingExample({Key? key}) : super(key: key);

  @override
  State<PaddingExample> createState() => _PaddingExampleState();
}

class _PaddingExampleState extends State<PaddingExample> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedPadding(
            padding: EdgeInsets.all(_isExpanded ? 50.0 : 10.0),
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              height: _isExpanded ? 200.0 : 150.0,
              width: _isExpanded ? 200.0 : 150.0,
              color: Colors.blue,
              child: const Center(
                child: Text('コンテンツ', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(_isExpanded ? 'サイズを縮小' : 'サイズを拡大'),
          ),
        ],
      ),
    );
  }
}
