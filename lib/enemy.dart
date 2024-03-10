import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:space_race/bullet.dart';
import 'explosions.dart';
import 'rocket_game.dart';


class Enemy extends SpriteComponent
    with HasGameRef<SpaceAdventure>, CollisionCallbacks {
  Enemy({
    super.position,
  }) : super(
          size: Vector2.all(50),
          anchor: Anchor.center,
        );

  static const enemySize = 50.0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('enemy.png');
    width = 50;
    height = 50;
    anchor = Anchor.center;

    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.y += dt * 250;

    if (position.y > game.size.y) {
      removeFromParent();
    }
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Bullet) {
      removeFromParent();
      other.removeFromParent();
      game.add(Explosion(position: position));
    }
  }
}