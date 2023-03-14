part of 'score_bloc.dart';

class ScoreState extends Equatable {
  final int score;
  final GemType gemType;
  const ScoreState({
    required this.score,
    required this.gemType,
  });

  factory ScoreState.initial() => const ScoreState(score: 0, gemType: GemType.red);

  @override
  List<Object> get props => [score, gemType];

  ScoreState copyWith({
    int? score,
    GemType? gemType,
  }) {
    return ScoreState(
      score: score ?? this.score,
      gemType: gemType ?? this.gemType,
    );
  }


  @override
  String toString() => 'ScoreState(score: $score, gemType: $gemType)';
}
