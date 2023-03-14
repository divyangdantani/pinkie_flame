import 'dart:developer';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:pinkie_flame/actors/pinkie.dart';
import 'package:pinkie_flame/blocs/score/bloc/score_bloc.dart';
import 'package:pinkie_flame/flame_layer/pinkie_game.dart';

class Treasure extends SpriteComponent
    with
        HasGameRef<PinkieGame>,
        CollisionCallbacks,
        FlameBlocListenable<ScoreBloc, ScoreState> {
  final Vector2 treasurePostion;
  Treasure({required this.treasurePostion})
      : super(position: treasurePostion, size: Vector2.all(100)) {
    debugMode = true;
  }

  late Sprite redGem;
  late Sprite pinkGem;
  late Sprite greenGem;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(RectangleHitbox());
    redGem = await gameRef.loadSprite('red_gem.png');
    pinkGem = await gameRef.loadSprite('pink_gem.png');
    greenGem = await gameRef.loadSprite('green_gem.png');
    sprite = redGem;
  }

  @override
  void onNewState(ScoreState state) {
    switch (state.gemType) {
      case GemType.red:
        sprite = redGem;
        break;
      case GemType.pink:
        sprite = pinkGem;
        break;
      case GemType.green:
        sprite = greenGem;
        break;
    }
    super.onNewState(state);
  }

  @override
  void update(double dt) {
    //x += 1;
    //y += 1;
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Pinkie) {
      log('There is a HIT!!!');
      gameRef.scoreBloc.add(IncreaseScoreEvent());
      removeFromParent();
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}
