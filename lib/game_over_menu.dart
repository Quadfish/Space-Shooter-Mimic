import 'package:flutter/material.dart';
import 'package:space_race/main_menu.dart';
import 'package:space_race/rocket_game.dart';

class GameOverMenu extends StatelessWidget {
  static const String id = 'GameOverMenu';
  final SpaceAdventure game;

  const GameOverMenu({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0),
            child: Text(
              'GAME OVER',
              style: TextStyle(
                fontFamily: 'Sixtyfour',
                fontSize: 60.0,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: ElevatedButton(
              onPressed: () {
                game.overlays.remove(GameOverMenu.id);
                game.reset();
                game.resumeEngine();
              },
              child: Text(
                  'RESTART',
                  style: TextStyle(
                    color: Colors.black,)
                ),
               style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Button color
                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                     RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(18.0),
                     ),
                   ),
                ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: ElevatedButton(
              onPressed: () {
                game.overlays.remove(GameOverMenu.id);
                game.reset();
                game.resumeEngine();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const MainMenu()),
                );
              },
              child: Text(
                  'EXIT',
                  style: TextStyle(
                    color: Colors.black,)
                ),
               style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Button color
                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                     RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(18.0),
                     ),
                   ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
