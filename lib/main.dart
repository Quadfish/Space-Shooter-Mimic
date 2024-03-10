// main.dart
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:space_race/rocket_game.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData.dark(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SpaceAdventure _spaceAdventure;
  bool _gameOver = false;

  @override
  void initState() {
    _spaceAdventure = SpaceAdventure();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GameWidget(game: _spaceAdventure),
          ),
          if (_spaceAdventure.isGamePlaying)
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _spaceAdventure.pauseGame();
                      });
                    },
                    icon: const Icon(Icons.pause),
                  ),
                  ValueListenableBuilder(
                    valueListenable: _spaceAdventure.current_score,
                    builder: (context, int value, child) {
                      return Text(
                        value.toString(),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          if (_spaceAdventure.isGameOver && !_spaceAdventure.isGamePaused)
            Container(
              color: Colors.black45,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'GAME OVER!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 140,
                      height: 140,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _spaceAdventure.resetGame();
                          });
                        },
                        icon: const Icon(
                          Icons.refresh,
                          size: 140,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (_spaceAdventure.isGamePaused && !_spaceAdventure.isGameOver)
            Container(
              color: Colors.black45,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'PAUSED!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 140,
                      height: 140,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _spaceAdventure.resumeGame();
                          });
                        },
                        icon: const Icon(
                          Icons.play_arrow,
                          size: 140,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
