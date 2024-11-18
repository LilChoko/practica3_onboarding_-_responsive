import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'onboarding_screen3.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animations/experience.json', // Archivo de animación actualizado
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 20),
          const Text(
            'Personaliza tu experiencia',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Escoge temas y preferencias para la app.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OnboardingScreen3()),
              );
            },
            child: const Text('Siguiente'),
          ),
        ],
      ),
    );
  }
}
