// import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:math';

class VerticalInfoColumn extends pw.StatelessWidget {
  final String ticketNumber;
  final String randomNumbers;

  VerticalInfoColumn({
    required this.ticketNumber,
    required this.randomNumbers,
  });

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      width: 30,
      child: pw.Column(
        children: [
          pw.Transform.rotate(
            angle: -pi / 2, // -90 grados en radianes
            child: pw.Container(
              width: 180,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('NOMBRE Y APELLIDO:',
                      style: const pw.TextStyle(fontSize: 8)),
                  pw.SizedBox(height: 5),
                  pw.Text('DNI:', style: const pw.TextStyle(fontSize: 8)),
                  pw.SizedBox(height: 5),
                  pw.Text('N° CARTÓN: $ticketNumber',
                      style: pw.TextStyle(
                          fontSize: 8, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 5),
                  pw.Text('NÚMEROS DEL CARTÓN: $randomNumbers',
                      style: pw.TextStyle(
                          fontSize: 8, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 5),
                  pw.Text('OBSERVACIONES:',
                      style: const pw.TextStyle(fontSize: 8)),
                  pw.SizedBox(height: 5),
                  pw.Text('SORTEA EL DÍA 15/04/25 POR QUINIELA',
                      style: const pw.TextStyle(fontSize: 8)),
                  pw.Text('NOCTURNA DE SAN JUAN',
                      style: const pw.TextStyle(fontSize: 8)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
