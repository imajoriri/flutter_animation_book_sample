import 'package:flutter/material.dart';
import 'screen/animated_opacity_screen.dart';
import 'screen/fade_transition_screen.dart';
import 'screen/scale_animation_controller_screen.dart';
import 'screen/animated_builder_screen.dart';
import 'screen/checkbox_screen.dart';
import 'screen/show_modal_bottom_sheet_screen.dart';
import 'screen/tween_animation_screen.dart';
import 'screen/custom_tween_screen.dart';
import 'screen/sequence_animation_screen.dart';
import 'screen/chain_animation_screen.dart';
import 'screen/animated_position_screen.dart';
import 'screen/sequential_animation_screen.dart';
import 'screen/color_transition_screen.dart';
import 'screen/animated_list_screen.dart';
import 'screen/animated_container_screen.dart';
import 'screen/animated_positioned_screen.dart';
import 'screen/animated_padding_screen.dart';
import 'screen/animated_size_screen.dart';
import 'screen/animated_switcher_screen.dart';
import 'screen/animated_cross_fade_screen.dart';
import 'screen/animated_default_text_style_screen.dart';
import 'screen/animated_physical_model_screen.dart';
import 'screen/animated_rotation_screen.dart';
import 'screen/animated_scale_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Flutter animation sample"),
      ),
      body: ListView(
        children: [
          _ListTile(
            title: const Text("AnimatedOpacity"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AnimatedOpacityScreen(),
                ),
              );
            },
          ),
          _ListTile(
            title: const Text("FadeTransition"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FadeTransitionScreen(),
                ),
              );
            },
          ),
          _ListTile(
            title: const Text("手動フェードアニメーション"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ScaleAnimationControllerScreen(),
                ),
              );
            },
          ),
          _ListTile(
            title: const Text("AnimatedBuilder"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AnimatedBuilderScreen(),
                ),
              );
            },
          ),
          _ListTile(
            title: const Text("チェックボックス"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CheckboxScreen()),
              );
            },
          ),
          _ListTile(
            title: const Text("ボトムシート"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ShowModalBottomSheetScreen(),
                ),
              );
            },
          ),
          _ListTile(
            title: const Text("Tweenアニメーション"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TweenAnimationScreen(),
                ),
              );
            },
          ),
          _ListTile(
            title: const Text("カスタムTweenデモ"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CustomTweenScreen(),
                ),
              );
            },
          ),
          _ListTile(
            title: const Text("TweenSequenceデモ"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SequenceAnimationScreen(),
                ),
              );
            },
          ),
          _ListTile(
            title: const Text("Chain Animationデモ"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ChainAnimationScreen(),
                ),
              );
            },
          ),
          _ListTile(
            title: const Text("左右移動アニメーション"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AnimatedPositionScreen(),
                ),
              );
            },
          ),
          _ListTile(
            title: const Text("AnimatedPositioned"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AnimatedPositionedScreen(),
                ),
              );
            },
          ),
          _ListTile(
            title: const Text("順次アニメーション"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SequentialAnimationScreen(),
                ),
              );
            },
          ),
          _ListTile(
            title: const Text("カラートランジション"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ColorTransitionScreen(),
                ),
              );
            },
          ),
          _ListTile(
            title: const Text("アニメーションリスト"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AnimatedListScreen(),
                ),
              );
            },
          ),
          _ListTile(
            title: const Text("AnimatedContainer"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AnimatedContainerScreen(),
                ),
              );
            },
          ),
          _ListTile(
            title: const Text("AnimatedPadding"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AnimatedPaddingScreen(),
                ),
              );
            },
          ),
          _ListTile(
            title: const Text("AnimatedSize"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AnimatedSizeScreen(),
                ),
              );
            },
          ),
          _ListTile(
            title: const Text("AnimatedSwitcher"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AnimatedSwitcherScreen(),
                ),
              );
            },
          ),
          _ListTile(
            title: const Text("AnimatedCrossFade"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AnimatedCrossFadeScreen(),
                ),
              );
            },
          ),
          _ListTile(
            title: const Text("AnimatedDefaultTextStyle"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AnimatedDefaultTextStyleScreen(),
                ),
              );
            },
          ),
          _ListTile(
            title: const Text("AnimatedPhysicalModel"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AnimatedPhysicalModelScreen(),
                ),
              );
            },
          ),
          _ListTile(
            title: const Text("AnimatedRotation"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AnimatedRotationScreen(),
                ),
              );
            },
          ),
          _ListTile(
            title: const Text("AnimatedScale"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AnimatedScaleScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({super.key, required this.title, required this.onTap});

  final Widget title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      onTap: onTap,
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
