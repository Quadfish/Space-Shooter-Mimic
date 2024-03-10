import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:space_race/rocket_game.dart';
import 'game_over_menu.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); 
  await Flame.device.fullScreen();

  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SpaceAdventure _spaceAdventure;

  @override
  void initState() {
    super.initState();
    _spaceAdventure = SpaceAdventure();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GameWidget<SpaceAdventure>(
              game: _spaceAdventure,
              overlayBuilderMap: {
                GameOverMenu.id: (_, __) => GameOverMenu(game: _spaceAdventure),
              },
              initialActiveOverlays: const [],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(10.0), // Add some padding for aesthetics
              child: Row(
                mainAxisSize: MainAxisSize.min, // Use minimum space
                children: [
                  // Score Display
                  ValueListenableBuilder(
                    valueListenable: _spaceAdventure.current_score,
                    builder: (context, int value, child) {
                      return Text(
                        "Score: $value",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Ensure the text is visible
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 10), // Space between score and icon
                  // Pause Button
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _spaceAdventure.pauseGame();
                      });
                    },
                    icon: const Icon(
                      Icons.pause,
                      color: Colors.white, // Ensure the icon is visible
                      size: 30,
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
