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
      padding: const pw.EdgeInsets.only(
          left: 5, right: 20), // Más espacio horizontal
      child: pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: [
          pw.Transform.rotate(
            angle: -pi / 2, // -90 grados en radianes
            child: pw.Container(
              width: 200, // Ancho aumentado
              // Necesario para posicionar correctamente el contenido rotado
              padding: const pw.EdgeInsets.only(bottom: 60),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Container(
                    width: 200, // Ancho fijo para evitar saltos de línea
                    child: pw.Text('NOMBRE Y APELLIDO:',
                        style: const pw.TextStyle(fontSize: 8)),
                  ),
                  pw.SizedBox(height: 5),
                  pw.Container(
                    width: 200,
                    child:
                        pw.Text('DNI:', style: const pw.TextStyle(fontSize: 8)),
                  ),
                  pw.SizedBox(height: 5),
                  pw.Container(
                    width: 200,
                    child: pw.Text('N° CARTÓN: $ticketNumber',
                        style: pw.TextStyle(
                            fontSize: 8, fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.SizedBox(height: 5),
                  pw.Container(
                    width: 200,
                    child: pw.Text('NÚMEROS DEL CARTÓN: $randomNumbers',
                        style: pw.TextStyle(
                            fontSize: 8, fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.SizedBox(height: 5),
                  pw.Container(
                    width: 200,
                    child: pw.Text('OBSERVACIONES:',
                        style: const pw.TextStyle(fontSize: 8)),
                  ),
                  pw.SizedBox(height: 5),
                  pw.Container(
                    width: 200,
                    child: pw.Text('SORTEA EL DÍA 15/04/25 POR QUINIELA',
                        style: const pw.TextStyle(fontSize: 8)),
                  ),
                  pw.Container(
                    width: 200,
                    child: pw.Text('NOCTURNA DE SAN JUAN',
                        style: const pw.TextStyle(fontSize: 8)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
