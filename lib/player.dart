// player.dart
import 'package:flame/components.dart';
import 'package:space_race/rocket_game.dart';
import 'bullet.dart';

class Player extends SpriteComponent
    with HasGameRef<SpaceAdventure> {
  Player()
      : super(
          size: Vector2(100, 150),
          anchor: Anchor.center,
        );

  late final SpawnComponent _bulletSpawner;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('player.png');
    position = Vector2(gameRef.size.x / 2, gameRef.size.y - 100);
    width = 50;
    height = 50;
    anchor = Anchor.center;

    _bulletSpawner = SpawnComponent(
    
      period: .2,
      selfPositioning: true,
      factory: (index) {
        return Bullet(
          position: position +
              Vector2(
                0,
                -height / 2,
              ),
        );
      },
      autoStart: false,
    );

    game.add(_bulletSpawner);


  }

  void move(Vector2 delta) {
    position.add(delta);
  }

  void startShooting() {
    _bulletSpawner.timer.start();

  }

  void stopShooting() {
    _bulletSpawner.timer.stop();
  }
}
