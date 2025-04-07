import 'package:flutter/material.dart';

class ShowModalBottomSheetScreen extends StatelessWidget {
  const ShowModalBottomSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ボトムシート サンプル')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  color: Colors.white,
                  child: const Center(child: Text('ボトムシートの内容')),
                );
              },
            );
          },
          child: const Text('ボトムシートを表示'),
        ),
      ),
    );
  }
}
