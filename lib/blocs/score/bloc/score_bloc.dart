import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'score_event.dart';
part 'score_state.dart';

enum GemType { red, pink, green}

class ScoreBloc extends Bloc<ScoreEvent, ScoreState> {
  ScoreBloc() : super(ScoreState.initial()) {
    on<IncreaseScoreEvent>((event, emit) {
     emit(state.copyWith(score: state.score + 1));
    });

    on<ChangeGemTypeEvent>((event, emit) => {
      emit(state.copyWith(gemType: event.gemType))
    });
  }
}
