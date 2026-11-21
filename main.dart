import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DioApp());
}

class DioApp extends StatelessWidget {
  const DioApp({super.key});

  static const Color dioRed = Color(0xFFF00008);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: dioRed,
          primary: dioRed,
          surface: Colors.white,
        ),
        fontFamily: 'Roboto',
      ),
      home: const LoginScreen(),
    );
  }
}
