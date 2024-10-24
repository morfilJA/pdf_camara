import 'package:flutter/material.dart';
import 'pdf_doc_camara.dart'; // Importa el archivo donde tienes la lógica para generar el PDF

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generar PDF',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generar Nota de Instalación/Retiro'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            generateCameraPdf(boletaNumero: '00123');
          },
          child: const Text('Generar PDF'),
        ),
      ),
    );
  }
}
