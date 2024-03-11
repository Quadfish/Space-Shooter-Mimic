// main_menu.dart
import 'package:flutter/material.dart';
import 'package:space_race/select_spaceship.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'), 
            fit: BoxFit.cover, 
          ),
        ),
        child: Column(
          children: [
            const Spacer(flex: 2), 
            const Text(
              'SPACE ADVENTURE',
              style: TextStyle(
                fontFamily: 'Sixtyfour',
                fontSize: 40.0,
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
            const Spacer(), 
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SelectSpaceshipScreen()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                child: const Text(
                  'PLAY',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const Spacer(flex: 3), 
          ],
        ),
      ),
    );
  }
}
