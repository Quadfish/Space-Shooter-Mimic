import 'package:flutter/material.dart';
import 'package:space_race/select_spaceship.dart';
import 'main.dart'; // Make sure to import your HomePage

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'), 
            fit: BoxFit.cover, 
          ),
        ),
        child: Column(
          children: [
            Spacer(flex: 2), 
            Text(
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
            Spacer(), 
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SelectSpaceshipScreen()),
                  );
                },
                child: Text(
                  'PLAY',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(flex: 3), 
          ],
        ),
      ),
    );
  }
}
