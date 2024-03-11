import 'package:flutter/material.dart';
import 'package:space_race/main.dart';

class SelectSpaceshipScreen extends StatefulWidget {
  @override
  _SelectSpaceshipScreenState createState() => _SelectSpaceshipScreenState();
}

class Spaceship {
  final String name;
  final String imagePath;

  Spaceship({required this.name, required this.imagePath});
}

class _SelectSpaceshipScreenState extends State<SelectSpaceshipScreen> {
  int _selectedShipIndex = -1;

  // Sample spaceships data - replace with your actual data and images
  List<Spaceship> spaceships = [
    Spaceship(name: "Spaceship 1", imagePath: "assets/images/rocket1.png"),
    Spaceship(name: "Spaceship 2", imagePath: "assets/images/rocket2.png"),
    Spaceship(name: "Spaceship 3", imagePath: "assets/images/rocket3.png"),
    // Add more spaceships as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Select Your Spaceship"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Adjust number of columns
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.0, // Adjust the aspect ratio of the cards
              ),
              itemCount: spaceships.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedShipIndex = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: _selectedShipIndex == index ? Border.all(color: Colors.blue, width: 3) : null,
                    ),
                    child: Image.asset(spaceships[index].imagePath, fit: BoxFit.cover),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _selectedShipIndex != -1 ? () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              } : null,
              child: Text('PLAY'),
            ),
          ),
        ],
      ),
    );
  }
}
