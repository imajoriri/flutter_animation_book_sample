import 'package:flutter/material.dart';

class AnimatedPhysicalModelScreen extends StatelessWidget {
  const AnimatedPhysicalModelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedPhysicalModel サンプル')),
      body: const Center(child: PhysicalModelExample()),
    );
  }
}

class PhysicalModelExample extends StatefulWidget {
  const PhysicalModelExample({Key? key}) : super(key: key);

  @override
  State<PhysicalModelExample> createState() => _PhysicalModelExampleState();
}

class _PhysicalModelExampleState extends State<PhysicalModelExample> {
  bool _isElevated = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedPhysicalModel(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            // 物理特性を指定
            elevation: _isElevated ? 20.0 : 1.0,
            shape: BoxShape.rectangle,
            shadowColor: Colors.black,
            color: Colors.white,
            borderRadius:
                _isElevated
                    ? BorderRadius.circular(16)
                    : BorderRadius.circular(4),
            child: Container(
              width: 200,
              height: 150,
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isElevated = !_isElevated;
              });
            },
            child: Text(_isElevated ? '沈める' : '浮き上がらせる'),
          ),
        ],
      ),
    );
  }
}
