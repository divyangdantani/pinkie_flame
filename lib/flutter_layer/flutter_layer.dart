import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/score/bloc/score_bloc.dart';

class FlutterLayer extends StatelessWidget {
  const FlutterLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScoreBloc, ScoreState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Score: ${state.score}'),
            TextButton(
                onPressed: () {
                  context.read<ScoreBloc>().add(IncreaseScoreEvent());
                },
                child: const Text('+ Socre'))
          ],
        );
      },
    );
  }
}
