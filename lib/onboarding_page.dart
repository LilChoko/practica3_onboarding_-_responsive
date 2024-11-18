import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  final String animationPath;
  final String title;
  final String description;
  final bool isLastPage;
  final VoidCallback? onFinish;
  final bool isSmallScreen;

  const OnboardingPage({
    super.key,
    required this.animationPath,
    required this.title,
    required this.description,
    this.isLastPage = false,
    this.onFinish,
    required this.isSmallScreen,
  });

  @override
  Widget build(BuildContext context) {
    final animationSize =
        isSmallScreen ? 150.0 : 200.0; // Tamaño responsivo de la animación
    final titleFontSize =
        isSmallScreen ? 20.0 : 24.0; // Tamaño responsivo del título
    final descriptionFontSize =
        isSmallScreen ? 14.0 : 16.0; // Tamaño responsivo de la descripción

    return Padding(
      padding: EdgeInsets.all(isSmallScreen ? 12.0 : 16.0),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Centra los widgets verticalmente
        children: [
          Lottie.asset(
            animationPath,
            width: animationSize,
            height: animationSize,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center, // Centra el texto horizontalmente
            style:
                TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center, // Centra el texto horizontalmente
            style: TextStyle(fontSize: descriptionFontSize),
          ),
          if (isLastPage) ...[
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: onFinish,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen ? 20 : 40,
                  vertical: isSmallScreen ? 12 : 16,
                ),
              ),
              child: Text(
                'Finalizar',
                style: TextStyle(fontSize: isSmallScreen ? 14 : 16),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
