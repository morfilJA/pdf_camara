import 'package:app/src/home_view_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generador de Cartones de Rifa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeViewPage(),
    );
  }
}
