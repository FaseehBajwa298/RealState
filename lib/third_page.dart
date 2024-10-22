import 'package:flutter/material.dart';
import 'House.dart';  // Import the House model

class ThirdPage extends StatelessWidget {
  final House house;  // Non-nullable house object

  ThirdPage({required this.house});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${house.name} Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the house's image with full width
            Image.asset(
              house.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            // Display the house's name
            Text(
              house.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Display the house's price
            Text(
              '\$${house.price.toStringAsFixed(2)}',  // Price shown on the third page
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10),
            // Display the house's location
            Text(
              house.location,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
