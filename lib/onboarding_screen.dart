import 'package:flutter/material.dart';
import 'home_page.dart';
import 'onboarding_page.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = constraints.maxWidth < 600;

          return PageView(
            children: [
              OnboardingPage(
                animationPath: 'assets/animations/welcome.json',
                title: 'Bienvenido a la aplicación',
                description:
                    'Aquí puedes aprender sobre nuestra funcionalidad.',
                isSmallScreen: isSmallScreen,
              ),
              OnboardingPage(
                animationPath: 'assets/animations/experience.json',
                title: 'Personaliza tu experiencia',
                description: 'Escoge temas y preferencias para la app.',
                isSmallScreen: isSmallScreen,
              ),
              OnboardingPage(
                animationPath: 'assets/animations/startsnow.json',
                title: 'Empieza ahora',
                description: 'Disfruta de todas nuestras funciones.',
                isLastPage: true,
                isSmallScreen: isSmallScreen,
                onFinish: () {
                  // Regresa a la pantalla de inicio
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
