import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PrizeSection extends pw.StatelessWidget {
  @override
  pw.Widget build(pw.Context context) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        // Left side - prize info
        pw.Expanded(
          flex: 7,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('1° PREMIO: ASADO COMPLETO',
                  style: pw.TextStyle(
                      fontSize: 10, fontWeight: pw.FontWeight.bold)),
              pw.Text('PARA 10 PERSONA',
                  style: pw.TextStyle(
                      fontSize: 10, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 3),
              pw.Container(
                width: 230,
                height: 1,
                color: PdfColors.black,
                margin: const pw.EdgeInsets.symmetric(vertical: 2),
              ),
              pw.Text('2° PREMIO: ASADO COMPLETO',
                  style: pw.TextStyle(
                      fontSize: 10, fontWeight: pw.FontWeight.bold)),
              pw.Text('PARA 5 PERSONAS',
                  style: pw.TextStyle(
                      fontSize: 10, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 3),
              pw.Container(
                width: 230,
                height: 1,
                color: PdfColors.black,
                margin: const pw.EdgeInsets.symmetric(vertical: 2),
              ),
              pw.Text('3° PREMIO: ASADO COMPLETO',
                  style: pw.TextStyle(
                      fontSize: 10, fontWeight: pw.FontWeight.bold)),
              pw.Text('PARA 5 PERSONAS',
                  style: pw.TextStyle(
                      fontSize: 10, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 3),
              pw.Container(
                width: 230,
                height: 1,
                color: PdfColors.black,
                margin: const pw.EdgeInsets.symmetric(vertical: 2),
              ),
              pw.Text('SORTEA EL DÍA 15/04/25 POR QUINIELA',
                  style: const pw.TextStyle(fontSize: 10)),
              pw.Text('NOCTURNA DE SAN JUAN',
                  style: const pw.TextStyle(fontSize: 10)),
            ],
          ),
        ),
        // Right side - Triple chance
        pw.Expanded(
          flex: 3,
          child: pw.Container(
            padding: const pw.EdgeInsets.only(left: 10),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Text('TRIPLE',
                    style: pw.TextStyle(
                        fontSize: 18, fontWeight: pw.FontWeight.bold)),
                pw.Text('CHANCE', style: const pw.TextStyle(fontSize: 16)),
                pw.SizedBox(height: 5),
                pw.Text('VALOR: \$5.000',
                    style: pw.TextStyle(
                        fontSize: 10, fontWeight: pw.FontWeight.bold)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
