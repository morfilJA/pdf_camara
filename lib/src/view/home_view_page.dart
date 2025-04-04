// ignore_for_file: use_build_context_synchronously

import 'package:app/src/services/pdf_service.dart';
import 'package:flutter/material.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({Key? key}) : super(key: key);

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  int startNumber = 1;
  int endNumber = 1000;
  bool isGenerating = false;

  void _generateRaffleTickets() async {
    setState(() {
      isGenerating = true;
    });

    try {
      await PdfService.generateRaffleTickets(
        startNumber: startNumber,
        endNumber: endNumber,
        imagePath: 'assets/grand_sorteo.png',
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        isGenerating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generador de Cartones de Rifa'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Configuración de Cartones de Rifa',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Expanded(
                    flex: 2,
                    child: Text('Número de inicio:'),
                  ),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      initialValue: startNumber.toString(),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          startNumber = int.tryParse(value) ?? 1;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Expanded(
                    flex: 2,
                    child: Text('Número de fin:'),
                  ),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      initialValue: endNumber.toString(),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          endNumber = int.tryParse(value) ?? 1000;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: isGenerating ? null : _generateRaffleTickets,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 24.0,
                  ),
                  child: Text(
                    isGenerating
                        ? 'Generando cartones...'
                        : 'Generar Cartones de Rifa',
                  ),
                ),
              ),
              if (isGenerating) ...[
                const SizedBox(height: 20),
                const CircularProgressIndicator(),
                const SizedBox(height: 10),
                const Text('Esta operación puede tardar varios minutos'),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
