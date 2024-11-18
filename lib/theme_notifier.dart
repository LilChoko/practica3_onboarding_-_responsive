import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _themeData;
  ThemeData get themeData => _themeData;

  ThemeNotifier(this._themeData);

  // Función para establecer el tema y guardar la preferencia
  void setTheme(ThemeData theme, {Color? customColor}) async {
    _themeData = theme;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();

    // Guardar el modo del tema
    if (theme == AppThemes.nightTheme) {
      prefs.setInt('themeMode', 1);
    } else if (theme == AppThemes.dayTheme) {
      prefs.setInt('themeMode', 0);
    } else {
      prefs.setInt('themeMode', 2); // Modo personalizado

      // Guardar el color personalizado en formato ARGB
      if (customColor != null) {
        prefs.setInt('customColor', customColor.value);
      }
    }
  }

  // Función para cargar el tema almacenado en SharedPreferences
  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    int themeMode = prefs.getInt('themeMode') ?? 0;

    if (themeMode == 1) {
      _themeData = AppThemes.nightTheme;
    } else if (themeMode == 0) {
      _themeData = AppThemes.dayTheme;
    } else if (themeMode == 2) {
      // Si el tema es personalizado, cargamos el color
      int? customColorValue = prefs.getInt('customColor');
      if (customColorValue != null) {
        Color customColor = Color(customColorValue);
        _themeData = AppThemes.customTheme(customColor, Colors.black);
      } else {
        _themeData = AppThemes
            .dayTheme; // Tema por defecto si no hay color personalizado
      }
    }

    notifyListeners();
  }
}
