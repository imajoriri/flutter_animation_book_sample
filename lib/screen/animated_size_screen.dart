import 'package:flutter/material.dart';

class AnimatedSizeScreen extends StatelessWidget {
  const AnimatedSizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedSize サンプル')),
      body: const Center(child: SizeExample()),
    );
  }
}

class SizeExample extends StatefulWidget {
  const SizeExample({Key? key}) : super(key: key);

  @override
  State<SizeExample> createState() => _SizeExampleState();
}

class _SizeExampleState extends State<SizeExample>
    with TickerProviderStateMixin {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: Container(
              width: 200,
              height: _isExpanded ? 200 : 100,
              color: Colors.blue,
              child: Center(
                child: Text(
                  _isExpanded ? '折りたたむ' : '展開する',
                  style: const TextStyle(color: Colors.white),
                ),
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
            child: Text(_isExpanded ? '折りたたむ' : '展開する'),
          ),
        ],
      ),
    );
  }
}
