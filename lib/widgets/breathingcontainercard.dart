import 'package:flutter/material.dart';

class BreathingContainerCard extends StatelessWidget {
  final String assetImagePath;
  final String title;
  final String subtitle;
  final Widget nextPage;

  const BreathingContainerCard({
    super.key,
    required this.assetImagePath,
    required this.title,
    required this.subtitle,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(screenWidth * 0.07),
        child: Container(
          height: screenHeight * 0.26,
          width: screenWidth * 0.42,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(screenWidth * 0.07),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(screenWidth * 0.07),
                child: Container(color: const Color.fromARGB(111, 69, 69, 69)),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.07),
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.07),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(screenWidth * 0.05),
                      child: Image.asset(
                        assetImagePath,
                        height: screenWidth * 0.18,
                        width: screenWidth * 0.18,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.012),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.006),
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
