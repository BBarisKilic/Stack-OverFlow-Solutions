import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Square(title: 'Flutter Demo Home Page'),
      );
}

class Square extends StatefulWidget {
  final String title;

  const Square({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  State<Square> createState() => _SquareState();
}

class _SquareState extends State<Square> {
  late SimpleAnimation _esamiController;

  bool get isPlaying => _esamiController.isActive;

  @override
  void initState() {
    _esamiController = SimpleAnimation('bell', autoplay: false);

    super.initState();
  }

  void _reset() {
    if (!isPlaying) {
      _esamiController.reset();
    }
  }

  Future<void> _togglePlay() async {
    if (isPlaying) return;

    _reset();
    _esamiController.isActive = true;

    await Future.delayed(
      const Duration(milliseconds: 20),
    );

    _esamiController.isActive = true;
  }

  @override
  void dispose() {
    _esamiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: InkWell(
            onTap: _togglePlay,
            child: SizedBox(
              width: 192,
              height: 192,
              child: Card(
                color: Colors.black26,
                elevation: 10,
                child: Center(
                  child: RiveAnimation.asset(
                    'assets/alarm.riv',
                    controllers: [_esamiController],
                    onInit: (_) => setState(() {}),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
