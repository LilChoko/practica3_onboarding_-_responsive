import 'package:flutter/material.dart';
import 'package:practica_3/onboarding_screen.dart';
import 'login_page.dart';
import 'settings_screen.dart';
//import 'onboarding_screen1.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        // Hacer que toda la pantalla sea desplazable
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Detecta el ancho de la pantalla para elegir diseño
            if (constraints.maxWidth < 600) {
              return _buildContent(context, isTablet: false);
            } else {
              return _buildContent(context, isTablet: true);
            }
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, {required bool isTablet}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: isTablet
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildExplanationList()),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildButtons(context),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildExplanationList(),
                SizedBox(height: 20),
                ..._buildButtons(context),
              ],
            ),
    );
  }

  Widget _buildExplanationList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bienvenido a la aplicación',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          'Esta aplicación te permite hacer lo siguiente:',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.check),
              title: Text('Ver una introducción sobre cómo usar la app.'),
            ),
            ListTile(
              leading: Icon(Icons.check),
              title: Text(
                  'Cambiar el tema de la aplicación (día, noche, personalizado).'),
            ),
            ListTile(
              leading: Icon(Icons.check),
              title: Text('Guardar tus preferencias de tema automáticamente.'),
            ),
            ListTile(
              leading: Icon(Icons.check),
              title:
                  Text('Explorar la aplicación con pantallas de Onboarding.'),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildButtons(BuildContext context) {
    return [
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsScreen()),
          );
        },
        child: Text('Cambiar el Tema'),
      ),
      SizedBox(height: 10),
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OnboardingScreen()),
          );
        },
        child: const Text('OnBoarding'),
      ),
    ];
  }
}
