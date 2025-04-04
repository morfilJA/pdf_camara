import 'package:app/src/view/home_view_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Generador de Cartones de Rifa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeViewPage(),
    );
  }
}
