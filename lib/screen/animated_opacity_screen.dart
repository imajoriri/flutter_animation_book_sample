import 'package:flutter/material.dart';

class AnimatedOpacityScreen extends StatelessWidget {
  const AnimatedOpacityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedOpacity サンプル')),
      body: const Center(child: OpacityExample()),
    );
  }
}

class OpacityExample extends StatefulWidget {
  const OpacityExample({Key? key}) : super(key: key);

  @override
  State<OpacityExample> createState() => _OpacityExampleState();
}

class _OpacityExampleState extends State<OpacityExample> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'AnimatedOpacity',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _visible = !_visible;
            });
          },
          child: Text(_visible ? 'フェードアウト' : 'フェードイン'),
        ),
      ],
    );
  }
}
