import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rive Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: MyRiveAnimation(),
      )
    );
  }
}

class MyRiveAnimation extends StatefulWidget {
  @override
  _MyRiveAnimationState createState() => _MyRiveAnimationState();
}

class _MyRiveAnimationState extends State<MyRiveAnimation> {
  final riveFileName = 'assets/truck.riv';
  Artboard _artboard;
  WiperAnimation _wipersController;
  bool _wipers = false;

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  // loads a Rive file
  void _loadRiveFile() async {
    final bytes = await rootBundle.load(riveFileName);
    final file = RiveFile();

    if (file.import(bytes)) {
      // Select an animation by its name
      setState(() => _artboard = file.mainArtboard
        ..addController(
          SimpleAnimation('idle'),
        ));
    }
  }

  void _wipersChange(bool wipersOn) {
    if (_wipersController == null) {
      _artboard.addController(
        _wipersController = WiperAnimation('windshield_wipers'),
      );
    }
    if (wipersOn) {
      _wipersController.start();
    } else {
      _wipersController.stop();
    }
    setState(() => _wipers = wipersOn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: _artboard != null
                ? Rive(
                    artboard: _artboard,
                    fit: BoxFit.cover,
                  )
                : Container()),
        SizedBox(
          height: 50,
          width: 200,
          child: SwitchListTile(
            title: const Text('Wipers'),
            value: _wipers,
            onChanged: _wipersChange,
          ),
        )
      ],
    );
  }
}

class WiperAnimation extends SimpleAnimation {
  WiperAnimation(String animationName) : super(animationName);

  start() {
    instance.animation.loop = Loop.loop;
    isActive = true;
  }

  stop() => instance.animation.loop = Loop.oneShot;
}
