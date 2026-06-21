import 'package:flutter/material.dart';
import 'package:tic_tac_tao/main_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainScreen());
  }
}
