import 'package:flame/components.dart';
import 'rocket_game.dart';

class Explosion extends SpriteAnimationComponent
    with HasGameReference<SpaceAdventure> {
  Explosion({
    super.position,
  }) : super(
          size: Vector2.all(150),
          anchor: Anchor.center,
          removeOnFinish: true,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    animation = await game.loadSpriteAnimation(
      'explosion.gif',
      SpriteAnimationData.sequenced(
        amount: 6,
        stepTime: .3,
        textureSize: Vector2.all(256),
        loop: false,
      ),
    );
  }
}