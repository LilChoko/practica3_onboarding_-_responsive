import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_notifier.dart';
import 'theme.dart';

class SettingsScreen extends StatelessWidget {
  final List<Color> customColors = [
    Color(0xFFFFE4E1), // #ffe4e1
    Color(0xFFCFB5B2), // #cfb5b2
    Color(0xFFFDF9C4), // #fdf9c4
    Color(0xFFD3D3D3), // #D3D3D3
    Color(0xFFAFEEEE), // #afeeee
  ];

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Seleccionar Tema"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = constraints.maxWidth < 600;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selecciona un tema:",
                  style: TextStyle(
                    fontSize: isSmallScreen ? 18 : 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                // Opciones de temas organizadas dinámicamente
                Expanded(
                  child: ListView(
                    children: [
                      // Opción de Tema de Día
                      ThemeOption(
                        title: "Tema de Día",
                        description: "Un tema brillante y claro.",
                        icon: Icons.wb_sunny, // Icono de sol
                        isSelected:
                            themeNotifier.themeData == AppThemes.dayTheme,
                        textColor: Colors.black,
                        onTap: () {
                          themeNotifier.setTheme(AppThemes.dayTheme);
                        },
                      ),
                      const SizedBox(height: 16),
                      // Opción de Tema de Noche
                      ThemeOption(
                        title: "Tema de Noche",
                        description: "Un tema oscuro y elegante.",
                        icon: Icons.nights_stay, // Icono de luna
                        isSelected:
                            themeNotifier.themeData == AppThemes.nightTheme,
                        textColor: Colors.white,
                        onTap: () {
                          themeNotifier.setTheme(AppThemes.nightTheme);
                        },
                      ),
                      const SizedBox(height: 16),
                      // Opción de Tema Personalizado
                      ThemeOption(
                        title: "Tema Personalizado",
                        description: "Un tema ajustado a tu estilo.",
                        icon: Icons.palette, // Icono de paleta
                        isSelected:
                            themeNotifier.themeData != AppThemes.dayTheme &&
                                themeNotifier.themeData != AppThemes.nightTheme,
                        textColor: themeNotifier
                                    .themeData.scaffoldBackgroundColor
                                    .computeLuminance() >
                                0.5
                            ? Colors.black // Usa negro si el fondo es claro
                            : Colors.white, // Usa blanco si el fondo es oscuro
                        onTap: () {
                          _showCustomColorDialog(context, themeNotifier);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Diálogo para seleccionar un color personalizado
  void _showCustomColorDialog(
      BuildContext context, ThemeNotifier themeNotifier) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Selecciona un color"),
          content: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: customColors.map((color) {
              return GestureDetector(
                onTap: () {
                  // Configura el tema personalizado con el color seleccionado
                  themeNotifier.setTheme(
                      AppThemes.customTheme(color, Colors.black),
                      customColor: color);
                  Navigator.pop(context);
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

// Widget reutilizable para las opciones de tema
class ThemeOption extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final bool isSelected;
  final Color textColor;
  final VoidCallback onTap;

  const ThemeOption({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.isSelected,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return GestureDetector(
      onTap: onTap, // Cambia el tema al tocar
      child: Container(
        padding: EdgeInsets.all(isSmallScreen ? 12.0 : 16.0),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor.withOpacity(0.1)
              : Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Colors.grey.withOpacity(0.3),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: isSmallScreen ? 30 : 40,
              color: isSelected ? textColor : Colors.grey.withOpacity(0.8),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 16 : 18,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? textColor : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 12 : 14,
                      color:
                          isSelected ? textColor.withOpacity(0.8) : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.radio_button_checked,
                color: textColor,
              )
            else
              const Icon(
                Icons.radio_button_unchecked,
                color: Colors.grey,
              ),
          ],
        ),
      ),
    );
  }
}
