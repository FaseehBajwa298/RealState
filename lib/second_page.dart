import 'package:flutter/material.dart';
import 'third_page.dart';
import 'House.dart';  // Import the House model

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create House and Land instances with updated prices
    House building1 = House(
      name: 'House 1',
      imageUrl: 'assets/images/1.png',
      price: 1200.0,  // Updated price between $1000 and $1500
      location: 'New York',
    );

    House building2 = House(
      name: 'House 2',
      imageUrl: 'assets/images/2.png',
      price: 1300.0,  // Updated price between $1000 and $1500
      location: 'Los Angeles',
    );

    House building3 = House(
      name: 'House 3',
      imageUrl: 'assets/images/3.png',
      price: 1500.0,  // Updated price between $1000 and $1500
      location: 'Chicago',
    );

    House land2 = House(
      name: 'Land 2',
      imageUrl: 'assets/images/4.png',
      price: 700.0,  // Updated price between $500 and $800
      location: 'Miami',
    );

    // New Land instance
    House land1 = House(
      name: 'Land 1',
      imageUrl: 'assets/images/6.png',
      price: 600.0,  // Updated price between $500 and $800
      location: 'San Francisco',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Available Houses and Lands'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Displaying House 1
              buildHouseCard(context, building1),
              SizedBox(height: 20),

              // Displaying House 2
              buildHouseCard(context, building2),
              SizedBox(height: 20),

              // Displaying House 3
              buildHouseCard(context, building3),
              SizedBox(height: 20),

              // Displaying Land 2
              buildHouseCard(context, land2),
              SizedBox(height: 20),

              // Displaying Land 1
              buildHouseCard(context, land1),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHouseCard(BuildContext context, House house) {
    return Column(
      children: [
        Image.asset(
          house.imageUrl,
          width: 300,
          height: 200,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 10),
        Text(
          house.name,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Apply animation on navigating to third page
        ElevatedButton(
          onPressed: () {
            // Navigate to the third page with animations
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => ThirdPage(house: house),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 1.0); // Slide from bottom
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;

                  var offsetTween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(offsetTween);

                  var fadeTween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
                  var fadeAnimation = animation.drive(fadeTween);

                  var rotateTween = Tween(begin: -0.1, end: 0.0).chain(CurveTween(curve: curve));
                  var rotateAnimation = animation.drive(rotateTween);

                  return FadeTransition(
                    opacity: fadeAnimation,
                    child: RotationTransition(
                      turns: rotateAnimation,
                      child: SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      ),
                    ),
                  );
                },
              ),
            );
          },
          child: Text('See Details'),
        ),
      ],
    );
  }
}
