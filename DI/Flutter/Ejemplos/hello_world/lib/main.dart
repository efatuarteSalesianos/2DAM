import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

double _volume = 0.0;

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorTween;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    _colorTween = _animationController
        .drive(ColorTween(begin: Colors.yellow, end: Colors.blue));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'Linear progress indicator with a fixed color',
              style: TextStyle(fontSize: 20),
            ),
            LinearProgressIndicator(
              value: _animationController.value,
              semanticsLabel: 'Barra de Carga',
              valueColor: _colorTween,
              backgroundColor: Colors.grey,
              minHeight: 50,
            ),
            IconButton(
              icon: const Icon(Icons.volume_up),
              tooltip: 'Subir Volumen',
              onPressed: () {
                setState(() {
                  _volume += 10;
                });
              },
            ),
            Text('Volume : $_volume')
          ],
        ),
      ),
    );
  }
}
