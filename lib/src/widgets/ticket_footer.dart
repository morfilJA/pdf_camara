import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class TicketFooter extends pw.StatelessWidget {
  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      children: [
        // Explanation text
        pw.SizedBox(height: 8),
        pw.Container(
          child: pw.Text(
            'El motivo de este sorteo es recaudar fondos para abaratar los costos generales de la cena de fin de año. Los números serán asignados a todos los representantes de las distinta areas de la Dirección de Telecomunicaciones y Emergencias Policiales D-8 y al personal civil del CISEM 911. Los cartones pueden ser vendidos a cualquier persona, pertenezca o no a la institución. Habrá una planilla de control y transparencia que podrá ser consultada a quienes lo deseen. Este sorteo se realizará todos los meses, los días 15 de cada mes hasta diciembre, debiendo rendir el dinero de los números el día 14 sin falta. ¡Muchas gracias a todos por participar! ¡Mucha suerte!',
            style: const pw.TextStyle(fontSize: 8),
            textAlign: pw.TextAlign.justify,
          ),
        ),

        // Línea punteada al final
        pw.Container(
          margin: const pw.EdgeInsets.only(top: 5),
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Container(
                width: 200,
                height: 1,
                decoration: const pw.BoxDecoration(
                  border: pw.Border(
                    bottom: pw.BorderSide(
                      color: PdfColors.black,
                      width: 1,
                      style: pw.BorderStyle.dashed,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
