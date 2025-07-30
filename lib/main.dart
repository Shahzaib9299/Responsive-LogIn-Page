import 'package:flutter/material.dart';
import 'package:my_app/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const my_app());
}

class my_app extends StatelessWidget {
  const my_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const login_page(),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
    );
  }
}
