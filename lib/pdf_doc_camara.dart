import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<void> generateCameraPdf({required String boletaNumero}) async {
  final pdf = pw.Document();

  // Construcción del contenido del PDF con un borde
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Container(
          decoration: pw.BoxDecoration(
            border: pw.Border.all(
              color: PdfColors.black, // Color del borde
              width: 2.0, // Grosor del borde
            ),
          ),
          padding: const pw.EdgeInsets.all(
              20), // Añade un padding para separar el borde del contenido
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'INFORME DE SERVICIO DE CÁMARA DE SEGURIDAD',
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(
                  height: 10), // Espacio entre el título y el número de boleta
              pw.Text(
                'Boleta N°: $boletaNumero',
                style:
                    pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(
                  height:
                      30), // Espacio entre el número de boleta y el resto del contenido
              pw.Text('Fecha: ____________________________________'),
              pw.SizedBox(height: 30),
              pw.Text('DATOS DE LA CÁMARA',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 20),
              pw.Bullet(text: 'Numero de la Cámara: 00123'), // Ejemplo de dato
              pw.Bullet(
                  text:
                      'Tipo de Cámara: ________________________________________'), // En blanco
              pw.Bullet(text: 'Departamento: Capital'),
              pw.Bullet(text: 'Calle: Av. Siempre Viva 742'),
              pw.Bullet(
                  text:
                      'Tipo de Servicio: ________________________________________'), // En blanco
              pw.Bullet(
                  text:
                      'Estado Inicial: ________________________________________'), // En blanco
              pw.Bullet(
                  text:
                      'Estado Final: ________________________________________'), // En blanco
              pw.SizedBox(height: 20),
              pw.Text('OBSERVACIONES',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text(
                '________________________________________\n' // Múltiples líneas en blanco
                '________________________________________\n'
                '________________________________________\n'
                '________________________________________',
              ),
              pw.SizedBox(height: 20),
              pw.Text('FIRMAS',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 20),
              pw.Text('(Solicitante)'),
              pw.SizedBox(height: 10),
              pw.Text('Firma: __________________________________________'),
              pw.SizedBox(height: 10),
              pw.Text('Nombre y Apellido: _______________________________'),
              pw.SizedBox(height: 10),
              pw.Text('DNI: ___________________________________________'),
              pw.SizedBox(height: 20),
              pw.Text('(Técnico Responsable)'),
              pw.SizedBox(height: 10),
              pw.Text('Firma: __________________________________________'),
              pw.SizedBox(height: 10),
              pw.Text('Nombre y Apellido: _______________________________'),
              pw.SizedBox(height: 10),
              pw.Text('DNI: ___________________________________________'),
            ],
          ),
        );
      },
    ),
  );

  // Mostrar el PDF generado en el visor
  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}
