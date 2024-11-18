import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'onboarding_screen2.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animations/welcome.json', // Archivo de animación actualizado
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 20),
          const Text(
            'Bienvenido a la aplicación',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Aquí puedes aprender sobre nuestra funcionalidad.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OnboardingScreen2()),
              );
            },
            child: const Text('Siguiente'),
          ),
        ],
      ),
    );
  }
}
