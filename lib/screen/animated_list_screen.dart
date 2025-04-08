import 'package:flutter/material.dart';

class AnimatedListScreen extends StatelessWidget {
  const AnimatedListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('アニメーションリストのサンプル')),
      body: const AnimatedListExample(),
    );
  }
}

class AnimatedListExample extends StatefulWidget {
  const AnimatedListExample({Key? key}) : super(key: key);

  @override
  State<AnimatedListExample> createState() => _AnimatedListExampleState();
}

class _AnimatedListExampleState extends State<AnimatedListExample> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _items = ['項目 1', '項目 2', '項目 3'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AnimatedList(
            key: _listKey,
            initialItemCount: _items.length,
            itemBuilder: (context, index, animation) {
              return _buildItem(_items[index], index, animation);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: _addItem, child: const Text('項目を追加')),
              ElevatedButton(
                onPressed: _items.isNotEmpty ? _removeLastItem : null,
                child: const Text('最後の項目を削除'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // アニメーション付きのリストアイテムを構築
  Widget _buildItem(String item, int index, Animation<double> animation) {
    // カーブ付きのアニメーションを作成
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutQuart,
    );

    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
      child: SizeTransition(
        sizeFactor: curvedAnimation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.3, 0), // 少し右からスライドイン
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: Card(
            margin: const EdgeInsets.all(8),
            elevation: 2,
            child: ListTile(
              title: Text(item),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => _removeItem(index),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 項目を追加するメソッド
  void _addItem() {
    final int index = _items.length;
    _items.add('項目 ${index + 1}');
    _listKey.currentState!.insertItem(
      index,
      duration: const Duration(milliseconds: 500),
    );
  }

  // 特定の項目を削除するメソッド
  void _removeItem(int index) {
    final String removedItem = _items.removeAt(index);

    // 削除アニメーションのビルダー
    Widget builder(BuildContext context, Animation<double> animation) {
      return _buildRemovedItem(removedItem, animation);
    }

    _listKey.currentState!.removeItem(
      index,
      builder,
      duration: const Duration(milliseconds: 500),
    );
  }

  // 最後の項目を削除するメソッド
  void _removeLastItem() {
    if (_items.isEmpty) return;
    _removeItem(_items.length - 1);
  }

  // 削除される項目のアニメーション
  Widget _buildRemovedItem(String item, Animation<double> animation) {
    // カーブ付きのアニメーションを作成
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeInQuart,
    );

    return FadeTransition(
      opacity: Tween<double>(begin: 1.0, end: 0.0).animate(curvedAnimation),
      child: SizeTransition(
        axisAlignment: -1.0, // 上部を固定してサイズ変更
        sizeFactor: curvedAnimation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero,
            end: const Offset(-0.3, 0), // 少し左にスライドアウト
          ).animate(curvedAnimation),
          child: Card(
            margin: const EdgeInsets.all(8),
            elevation: 2,
            color: Colors.red.shade100, // 削除項目を視覚的に区別
            child: ListTile(
              title: Text(item),
              trailing: const Icon(Icons.delete),
            ),
          ),
        ),
      ),
    );
  }
}
