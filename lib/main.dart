import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_notifier.dart';
import 'theme.dart';
import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Cargar el tema inicial desde SharedPreferences
  final themeNotifier = ThemeNotifier(AppThemes.dayTheme);
  await themeNotifier.loadTheme(); // Carga el tema guardado

  runApp(
    ChangeNotifierProvider(
      create: (_) => themeNotifier,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeNotifier.themeData,
          home: const LoginPage(), // Pantalla inicial
        );
      },
    );
  }
}
