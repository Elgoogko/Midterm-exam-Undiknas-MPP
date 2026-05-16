import 'package:basic_app/components/common_app_bar.dart';
import 'package:flutter/material.dart';

class ImageTest extends StatelessWidget {
  const ImageTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Image Test'),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;
          final isPortrait = screenHeight > screenWidth;
          final imageSize = isPortrait ? screenWidth * 0.6 : screenHeight * 0.6;

          final textSize = ((screenHeight + screenWidth) * 0.02).clamp(
            14.0,
            42.0,
          );
          final spacing = (screenWidth * 0.05).clamp(1.0, 20.0);

          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: spacing,
                  vertical: spacing,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: spacing * 0.8,
                      children: [
                        Text(
                          'This is an image loaded from the network (Paris)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: textSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: imageSize,
                            maxWidth: imageSize,
                          ),
                          child: Image.network(
                            fit: BoxFit.contain,
                            "https://static.independent.co.uk/2025/04/25/13/42/iStock-1498516775.jpg",
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: imageSize * 0.8,
                                width: imageSize * 0.8,
                                color: Colors.grey[300],
                                child: const Center(
                                  child: Text('Image non trouvée'),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: spacing * 1.5),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: spacing * 0.8,
                      children: [
                        Text(
                          'This is an image loaded from the assets (Marseille)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: textSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: imageSize,
                            maxWidth: imageSize,
                          ),
                          child: Image.asset(
                            fit: BoxFit.contain,
                            "assets/images/marseille.jpeg",
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: imageSize * 0.8,
                                width: imageSize * 0.8,
                                color: Colors.grey[300],
                                child: const Center(
                                  child: Text('Image non trouvée'),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
