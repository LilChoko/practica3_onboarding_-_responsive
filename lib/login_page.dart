import 'package:flutter/material.dart';
import 'package:practica_3/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Obtén el tema actual

    // Color del cuadro del login, basado en el tema actual
    final containerColor =
        theme.brightness == Brightness.dark ? Colors.grey[800] : Colors.white;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor, // Fondo dinámico
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Determinar si es una pantalla pequeña (por ejemplo, móvil) o grande (por ejemplo, tablet)
          final isSmallScreen = constraints.maxWidth < 600;

          return Stack(
            children: [
              // Círculos decorativos, usando el color del cuadro de login
              Positioned(
                top: -100,
                left: -50,
                child: Container(
                  width:
                      isSmallScreen ? 150 : 200, // Escalado según la pantalla
                  height: isSmallScreen ? 150 : 200,
                  decoration: BoxDecoration(
                    color: containerColor!.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                bottom: -50,
                right: -50,
                child: Container(
                  width:
                      isSmallScreen ? 120 : 150, // Escalado según la pantalla
                  height: isSmallScreen ? 120 : 150,
                  decoration: BoxDecoration(
                    color: containerColor.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              // Contenido principal
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 16 : 32, // Ajuste de padding
                  ),
                  child: Container(
                    padding: EdgeInsets.all(isSmallScreen ? 16 : 24),
                    decoration: BoxDecoration(
                      color:
                          containerColor, // Usa el mismo color para el cuadro
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: isSmallScreen ? 24 : 28, // Escalado
                            fontWeight: FontWeight.bold,
                            color: theme.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Campo Usuario
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: theme.primaryColor,
                            ),
                            hintText: "Usuario",
                            filled: true,
                            fillColor: theme.scaffoldBackgroundColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Campo Contraseña
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: theme.primaryColor,
                            ),
                            hintText: "Contraseña",
                            filled: true,
                            fillColor: theme.scaffoldBackgroundColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Botón de Login
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: isSmallScreen ? 64 : 80, // Escalado
                              vertical: 16,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: isSmallScreen ? 14 : 16, // Escalado
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
