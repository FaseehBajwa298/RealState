import 'package:flutter/material.dart';
import 'second_page.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Fade in animation for text
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // Scale animation for the button
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    );

    // Start the animations
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fullscreen background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/5.png', // Your background image asset
              fit: BoxFit.cover, // Make the image cover the entire screen
            ),
          ),
          // Centered content with fade-in and scale animations
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Fade transition for the text with a rounded white background
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.white, // White background color for the text
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                        boxShadow: [ // Optional: adds shadow for depth effect
                          BoxShadow(
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(0, 4),
                          )
                        ]
                    ),
                    child: Text(
                      'Bajwa Real Estate',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.white,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Scale transition for the button
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the second page with multiple animations
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => SecondPage(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(0.0, 1.0);
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
                    child: Text('Open'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
