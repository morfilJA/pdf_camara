import 'package:app/src/pdf_doc_camara.dart';
import 'package:flutter/material.dart';

class HomeViewPage extends StatelessWidget {
  const HomeViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generar Cartones Sorteo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            generateRaffleTickets(
              startNumber: 1,
              endNumber: 1000,
              imagePath:
                  'assets/grand_sorteo.png', // Make sure this image is in your assets folder
            );
          },
          child: const Text('Generar PDF'),
        ),
      ),
    );
  }
}
