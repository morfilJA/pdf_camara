import 'package:app/src/home_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Generar PDF',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeViewPage(),
    );
  }
}
