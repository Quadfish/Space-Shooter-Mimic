import 'package:flutter/material.dart';
import 'main.dart'; // Make sure to import your HomePage

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Game title
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Text(
                'SPACE ADVENTURE',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 20.0,
                      color: Colors.white,
                      offset: Offset(0, 0),
                    )
                  ],
                ),
              ),
            ),
        
            // Play button
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomePage()), // Navigate to HomePage
                  );
                },
                child: const Text('Play'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
