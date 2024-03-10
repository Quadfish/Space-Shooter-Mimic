// rocket_game.dart
import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'player.dart';
import 'enemy.dart';


class SpaceAdventure extends FlameGame with PanDetector, HasCollisionDetection {
  late final Player player;


  @override
  FutureOr<void> onLoad() async {
        final parallax = await loadParallaxComponent(
      [
        ParallaxImageData('stars_0.png'),
      ],
      baseVelocity: Vector2(0, -5),
      repeat: ImageRepeat.repeat,
      velocityMultiplierDelta: Vector2(0, 5),
    );
    add(parallax);

    player = Player();
    add(player);

    add(
      SpawnComponent(
        factory: (index) {
          return Enemy();
        },
        period: 1,
        area: Rectangle.fromLTWH(0, 0, size.x, -Enemy.enemySize),
      ),
    );
  }


  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.move(info.delta.global);
  }

    @override
  void onPanStart(DragStartInfo info) {
    player.startShooting();
  }

  @override
  void onPanEnd(DragEndInfo info) {
    player.stopShooting();
  }


@override
  void update(double dt) {
    super.update(dt);
   
    for (final enemy in children.whereType<Enemy>()) {
      if (player.toRect().overlaps(enemy.toRect())) {    
        pauseEngine();
        // Here you might show a game over screen or overlay
        break;        
      }
    }
  }
}
