import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class SpaceShooterGame extends FlameGame with PanDetector, TapDetector {
  late Player player;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    player = Player();

    add(player);
    add(EnemyManager());

  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.move(info.delta.global);
  }

  @override
  void update(double dt) {
    super.update(dt);
   
    for (final enemy in children.whereType<Enemy>()) {
      // Collision detection between the player and enemies
      if (player.toRect().overlaps(enemy.toRect())) {
        // Logic to handle game over
        pauseEngine();  // Pause the game
        // Here you might show a game over screen or overlay
        break;  // If a collision is found, break the loop
      }
    }
  }
}

class EnemyManager extends TimerComponent with HasGameRef<SpaceShooterGame> {
  static final _random = Random();

  EnemyManager() : super(period: 1, repeat: true);

  @override
  void onTick() {
    super.onTick();

    _spawnEnemy();
  }

  void _spawnEnemy() {
    final enemy = Enemy(
      position: Vector2(_random.nextDouble() * gameRef.size.x, 0),
    );

    gameRef.add(enemy);
  }
}

class Enemy extends SpriteComponent with HasGameRef<SpaceShooterGame> {
  static const _speed = 450;

  Enemy({required super.position});

  @override
  Future<void> onLoad() async {
    super.onLoad();

    sprite = await gameRef.loadSprite('enemy.png');
    width = 50;
    height = 50;
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.y += _speed * dt;

    if (position.y > gameRef.size.y) {
      gameRef.remove(this);
    }
  }
}

class Player extends SpriteComponent with HasGameRef<SpaceShooterGame> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('player.png');
    position = Vector2(gameRef.size.x / 2, gameRef.size.y - 100);
    width = 50;
    height = 50;
    anchor = Anchor.center;
  }

  void move(Vector2 delta) {
    position.add(delta);
  }
}



void main() {
  runApp(GameWidget(
    game: SpaceShooterGame(),
  ));
}