import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinkie_flame/blocs/score/bloc/score_bloc.dart';
import 'package:pinkie_flame/flame_layer/flame_layer.dart';
import 'package:pinkie_flame/flutter_layer/flutter_layer.dart';

import 'flutter_layer/main_drawer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.setLandscape();
  Flame.device.fullScreen();
  runApp(const PinkieApp());
}

class PinkieApp extends StatelessWidget {
  const PinkieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: const TextTheme(
              bodyText2: TextStyle(color: Colors.orange, fontSize: 24)),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.orange,
                  backgroundColor: Colors.blueGrey,
                  textStyle: const TextStyle(fontSize: 24)))),
      home: BlocProvider<ScoreBloc>(
        create: (context) => ScoreBloc(),
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 30,
              backgroundColor: Colors.black,
              foregroundColor: Colors.orange,
            ),
            drawer: MainDrawer(),
            body: Stack(
              children: const [FrameLayer(), FlutterLayer()],
            )),
      ),
    );
  }
}
