import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinkie_flame/blocs/score/bloc/score_bloc.dart';
import 'package:pinkie_flame/flame_layer/pinkie_game.dart';

class FrameLayer extends StatelessWidget {
  const FrameLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: PinkieGame(scoreBloc: context.read<ScoreBloc>()),
    );
  }
}