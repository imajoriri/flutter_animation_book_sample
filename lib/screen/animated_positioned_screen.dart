import 'package:flutter/material.dart';

class AnimatedPositionedScreen extends StatelessWidget {
  const AnimatedPositionedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedPositioned サンプル')),
      body: const Center(child: PositionedExample()),
    );
  }
}

class PositionedExample extends StatefulWidget {
  const PositionedExample({Key? key}) : super(key: key);

  @override
  State<PositionedExample> createState() => _PositionedExampleState();
}

class _PositionedExampleState extends State<PositionedExample> {
  bool _isMoved = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        color: Colors.grey.shade200,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              top: _isMoved ? 180 : 20,
              right: _isMoved ? 20 : 180,
              width: 100,
              height: 100,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isMoved = !_isMoved;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'タップして\n移動',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
