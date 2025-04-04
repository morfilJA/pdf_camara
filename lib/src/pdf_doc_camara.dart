// import 'package:flutter/services.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
// import 'dart:math';

// class RaffleNumberGenerator {
//   // Set to keep track of all generated number combinations
//   final Set<String> usedCombinations = {};

//   // Generate a random 9-digit number with format xxx-xxx-xxx
//   String generateUniqueNumberCombination() {
//     Random random = Random();
//     String combination;

//     do {
//       // Generate 3 groups of 3-digit numbers (with leading zeros if needed)
//       String part1 = random.nextInt(1000).toString().padLeft(3, '0');
//       String part2 = random.nextInt(1000).toString().padLeft(3, '0');
//       String part3 = random.nextInt(1000).toString().padLeft(3, '0');

//       combination = '$part1-$part2-$part3';
//     } while (usedCombinations.contains(combination));

//     // Add to used combinations set
//     usedCombinations.add(combination);
//     return combination;
//   }
// }

// Future<void> generateRaffleTickets({
//   required int startNumber,
//   required int endNumber,
//   required String imagePath,
// }) async {
//   final pdf = pw.Document();
//   final raffleGenerator = RaffleNumberGenerator();

//   // Load the image from assets
//   final ByteData imageData = await rootBundle.load(imagePath);
//   final Uint8List imageBytes = imageData.buffer.asUint8List();
//   final pw.MemoryImage image = pw.MemoryImage(imageBytes);

//   // Create tickets for the specified range
//   for (int ticketNumber = startNumber;
//       ticketNumber <= endNumber;
//       ticketNumber++) {
//     String formattedTicketNumber = ticketNumber.toString().padLeft(3, '0');
//     String randomNumbers = raffleGenerator.generateUniqueNumberCombination();

//     pdf.addPage(
//       pw.Page(
//         margin: const pw.EdgeInsets.all(10),
//         build: (pw.Context context) {
//           return pw.Container(
//             decoration: pw.BoxDecoration(
//               border: pw.Border.all(
//                 color: PdfColors.black,
//                 width: 1.5,
//               ),
//             ),
//             child: pw.Container(
//               padding: const pw.EdgeInsets.all(8),
//               child: pw.Column(
//                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                 children: [
//                   // Top section with vertical info on left, image in center, prizes on right
//                   pw.Row(
//                     crossAxisAlignment: pw.CrossAxisAlignment.start,
//                     children: [
//                       // Left column - Vertical text with dotted line
//                       pw.Container(
//                         width: 30,
//                         child: pw.Column(
//                           children: [
//                             pw.Transform.rotate(
//                               angle: -pi / 2, // -90 grados en radianes
//                               child: pw.Container(
//                                 width: 180,
//                                 child: pw.Column(
//                                   crossAxisAlignment:
//                                       pw.CrossAxisAlignment.start,
//                                   children: [
//                                     pw.Text('NOMBRE Y APELLIDO:',
//                                         style: const pw.TextStyle(fontSize: 8)),
//                                     pw.SizedBox(height: 5),
//                                     pw.Text('DNI:',
//                                         style: const pw.TextStyle(fontSize: 8)),
//                                     pw.SizedBox(height: 5),
//                                     pw.Text('N° CARTÓN: $formattedTicketNumber',
//                                         style: pw.TextStyle(
//                                             fontSize: 8,
//                                             fontWeight: pw.FontWeight.bold)),
//                                     pw.SizedBox(height: 5),
//                                     pw.Text(
//                                         'NÚMEROS DEL CARTÓN: $randomNumbers',
//                                         style: pw.TextStyle(
//                                             fontSize: 8,
//                                             fontWeight: pw.FontWeight.bold)),
//                                     pw.SizedBox(height: 5),
//                                     pw.Text('OBSERVACIONES:',
//                                         style: const pw.TextStyle(fontSize: 8)),
//                                     pw.SizedBox(height: 5),
//                                     pw.Text(
//                                         'SORTEA EL DÍA 15/04/25 POR QUINIELA',
//                                         style: const pw.TextStyle(fontSize: 8)),
//                                     pw.Text('NOCTURNA DE SAN JUAN',
//                                         style: const pw.TextStyle(fontSize: 8)),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),

//                       // Dotted line separator
//                       pw.Container(
//                         margin: const pw.EdgeInsets.only(left: 5, right: 5),
//                         width: 1,
//                         height: 200,
//                         decoration: const pw.BoxDecoration(
//                           border: pw.Border(
//                             left: pw.BorderSide(
//                               color: PdfColors.black,
//                               width: 1,
//                               style: pw.BorderStyle.dashed,
//                             ),
//                           ),
//                         ),
//                       ),

//                       // Main content area
//                       pw.Expanded(
//                         child: pw.Column(
//                           crossAxisAlignment: pw.CrossAxisAlignment.start,
//                           children: [
//                             // Gran Sorteo image
//                             pw.Center(
//                               child: pw.Container(
//                                 height: 100,
//                                 width: 200,
//                                 child: pw.Image(image, fit: pw.BoxFit.contain),
//                               ),
//                             ),

//                             // Ticket number and random numbers
//                             pw.Center(
//                               child: pw.Column(
//                                 children: [
//                                   pw.Text('CARTÓN N°: $formattedTicketNumber',
//                                       style: pw.TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: pw.FontWeight.bold)),
//                                   pw.Text(randomNumbers,
//                                       style: pw.TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: pw.FontWeight.bold)),
//                                 ],
//                               ),
//                             ),

//                             pw.Divider(thickness: 1),

//                             // Main prize description section
//                             pw.Row(
//                               crossAxisAlignment: pw.CrossAxisAlignment.start,
//                               children: [
//                                 // Left side - prize info
//                                 pw.Expanded(
//                                   flex: 7,
//                                   child: pw.Column(
//                                     crossAxisAlignment:
//                                         pw.CrossAxisAlignment.start,
//                                     children: [
//                                       pw.Text('1° PREMIO: ASADO COMPLETO',
//                                           style: pw.TextStyle(
//                                               fontSize: 10,
//                                               fontWeight: pw.FontWeight.bold)),
//                                       pw.Text('PARA 10 PERSONA',
//                                           style: pw.TextStyle(
//                                               fontSize: 10,
//                                               fontWeight: pw.FontWeight.bold)),
//                                       pw.SizedBox(height: 3),
//                                       pw.Container(
//                                         width: 230,
//                                         height: 1,
//                                         color: PdfColors.black,
//                                         margin: const pw.EdgeInsets.symmetric(
//                                             vertical: 2),
//                                       ),
//                                       pw.Text('2° PREMIO: ASADO COMPLETO',
//                                           style: pw.TextStyle(
//                                               fontSize: 10,
//                                               fontWeight: pw.FontWeight.bold)),
//                                       pw.Text('PARA 5 PERSONAS',
//                                           style: pw.TextStyle(
//                                               fontSize: 10,
//                                               fontWeight: pw.FontWeight.bold)),
//                                       pw.SizedBox(height: 3),
//                                       pw.Container(
//                                         width: 230,
//                                         height: 1,
//                                         color: PdfColors.black,
//                                         margin: const pw.EdgeInsets.symmetric(
//                                             vertical: 2),
//                                       ),
//                                       pw.Text('3° PREMIO: ASADO COMPLETO',
//                                           style: pw.TextStyle(
//                                               fontSize: 10,
//                                               fontWeight: pw.FontWeight.bold)),
//                                       pw.Text('PARA 5 PERSONAS',
//                                           style: pw.TextStyle(
//                                               fontSize: 10,
//                                               fontWeight: pw.FontWeight.bold)),
//                                       pw.SizedBox(height: 3),
//                                       pw.Container(
//                                         width: 230,
//                                         height: 1,
//                                         color: PdfColors.black,
//                                         margin: const pw.EdgeInsets.symmetric(
//                                             vertical: 2),
//                                       ),
//                                       pw.Text(
//                                           'SORTEA EL DÍA 15/04/25 POR QUINIELA',
//                                           style:
//                                               const pw.TextStyle(fontSize: 10)),
//                                       pw.Text('NOCTURNA DE SAN JUAN',
//                                           style:
//                                               const pw.TextStyle(fontSize: 10)),
//                                     ],
//                                   ),
//                                 ),
//                                 // Right side - Triple chance
//                                 pw.Expanded(
//                                   flex: 3,
//                                   child: pw.Container(
//                                     padding: const pw.EdgeInsets.only(left: 10),
//                                     child: pw.Column(
//                                       crossAxisAlignment:
//                                           pw.CrossAxisAlignment.center,
//                                       children: [
//                                         pw.Text('TRIPLE',
//                                             style: pw.TextStyle(
//                                                 fontSize: 18,
//                                                 fontWeight:
//                                                     pw.FontWeight.bold)),
//                                         pw.Text('CHANCE',
//                                             style: const pw.TextStyle(
//                                                 fontSize: 16)),
//                                         pw.SizedBox(height: 5),
//                                         pw.Text('VALOR: \$5.000',
//                                             style: pw.TextStyle(
//                                                 fontSize: 10,
//                                                 fontWeight:
//                                                     pw.FontWeight.bold)),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),

//                             // Explanation text
//                             pw.SizedBox(height: 8),
//                             pw.Container(
//                               child: pw.Text(
//                                 'El motivo de este sorteo es recaudar fondos para abaratar los costos generales de la cena de fin de año. Los números serán asignados a todos los representantes de las distinta areas de la Dirección de Telecomunicaciones y Emergencias Policiales D-8 y al personal civil del CISEM 911. Los cartones pueden ser vendidos a cualquier persona, pertenezca o no a la institución. Habrá una planilla de control y transparencia que podrá ser consultada a quienes lo deseen. Este sorteo se realizará todos los meses, los días 15 de cada mes hasta diciembre, debiendo rendir el dinero de los números el día 14 sin falta. ¡Muchas gracias a todos por participar! ¡Mucha suerte!',
//                                 style: const pw.TextStyle(fontSize: 8),
//                                 textAlign: pw.TextAlign.justify,
//                               ),
//                             ),

//                             // Por esto:
//                             pw.Container(
//                               margin: const pw.EdgeInsets.only(top: 5),
//                               child: pw.Row(
//                                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                                 children: [
//                                   pw.Container(
//                                     width: 200,
//                                     height: 1,
//                                     decoration: const pw.BoxDecoration(
//                                       border: pw.Border(
//                                         bottom: pw.BorderSide(
//                                           color: PdfColors.black,
//                                           width: 1,
//                                           style: pw.BorderStyle.dashed,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   // Save and print PDF
//   await Printing.layoutPdf(
//     onLayout: (PdfPageFormat format) async => pdf.save(),
//   );
// }

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:math';

class RaffleNumberGenerator {
  // Set to keep track of all generated number combinations
  final Set<String> usedCombinations = {};

  // Generate a random 9-digit number with format xxx-xxx-xxx
  String generateUniqueNumberCombination() {
    Random random = Random();
    String combination;

    do {
      // Generate 3 groups of 3-digit numbers (with leading zeros if needed)
      String part1 = random.nextInt(1000).toString().padLeft(3, '0');
      String part2 = random.nextInt(1000).toString().padLeft(3, '0');
      String part3 = random.nextInt(1000).toString().padLeft(3, '0');

      combination = '$part1-$part2-$part3';
    } while (usedCombinations.contains(combination));

    // Add to used combinations set
    usedCombinations.add(combination);
    return combination;
  }
}

Future<void> generateRaffleTickets({
  required int startNumber,
  required int endNumber,
  required String imagePath,
}) async {
  final pdf = pw.Document();
  final raffleGenerator = RaffleNumberGenerator();

  // Load the image from assets
  final ByteData imageData = await rootBundle.load(imagePath);
  final Uint8List imageBytes = imageData.buffer.asUint8List();
  final pw.MemoryImage image = pw.MemoryImage(imageBytes);

  // Create tickets for the specified range
  for (int ticketNumber = startNumber;
      ticketNumber <= endNumber;
      ticketNumber++) {
    String formattedTicketNumber = ticketNumber.toString().padLeft(3, '0');
    String randomNumbers = raffleGenerator.generateUniqueNumberCombination();

    pdf.addPage(
      pw.Page(
        margin: const pw.EdgeInsets.all(10),
        build: (pw.Context context) {
          return pw.Container(
            decoration: pw.BoxDecoration(
              border: pw.Border.all(
                color: PdfColors.black,
                width: 1.5,
              ),
            ),
            child: pw.Container(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  // Top section with vertical info on left, image in center, prizes on right
                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      // Left column - Vertical text with dotted line
                      pw.Container(
                        width: 30,
                        child: pw.Column(
                          children: [
                            pw.Transform.rotate(
                              angle: -pi / 2, // -90 grados en radianes
                              child: pw.Container(
                                width: 180,
                                child: pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text('NOMBRE Y APELLIDO:',
                                        style: const pw.TextStyle(fontSize: 8)),
                                    pw.SizedBox(height: 5),
                                    pw.Text('DNI:',
                                        style: const pw.TextStyle(fontSize: 8)),
                                    pw.SizedBox(height: 5),
                                    pw.Text('N° CARTÓN: $formattedTicketNumber',
                                        style: pw.TextStyle(
                                            fontSize: 8,
                                            fontWeight: pw.FontWeight.bold)),
                                    pw.SizedBox(height: 5),
                                    pw.Text(
                                        'NÚMEROS DEL CARTÓN: $randomNumbers',
                                        style: pw.TextStyle(
                                            fontSize: 8,
                                            fontWeight: pw.FontWeight.bold)),
                                    pw.SizedBox(height: 5),
                                    pw.Text('OBSERVACIONES:',
                                        style: const pw.TextStyle(fontSize: 8)),
                                    pw.SizedBox(height: 5),
                                    pw.Text(
                                        'SORTEA EL DÍA 15/04/25 POR QUINIELA',
                                        style: const pw.TextStyle(fontSize: 8)),
                                    pw.Text('NOCTURNA DE SAN JUAN',
                                        style: const pw.TextStyle(fontSize: 8)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Dotted line separator
                      pw.Container(
                        margin: const pw.EdgeInsets.only(left: 5, right: 5),
                        width: 1,
                        height: 200,
                        decoration: const pw.BoxDecoration(
                          border: pw.Border(
                            left: pw.BorderSide(
                              color: PdfColors.black,
                              width: 1,
                              style: pw.BorderStyle.dashed,
                            ),
                          ),
                        ),
                      ),

                      // Main content area
                      pw.Expanded(
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            // Gran Sorteo image
                            pw.Center(
                              child: pw.Container(
                                height: 100,
                                width: 200,
                                child: pw.Image(image, fit: pw.BoxFit.contain),
                              ),
                            ),

                            // Ticket number and random numbers
                            pw.Center(
                              child: pw.Column(
                                children: [
                                  pw.Text('CARTÓN N°: $formattedTicketNumber',
                                      style: pw.TextStyle(
                                          fontSize: 18,
                                          fontWeight: pw.FontWeight.bold)),
                                  pw.Text(randomNumbers,
                                      style: pw.TextStyle(
                                          fontSize: 18,
                                          fontWeight: pw.FontWeight.bold)),
                                ],
                              ),
                            ),

                            pw.Divider(thickness: 1),

                            // Main prize description section
                            pw.Row(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                // Left side - prize info
                                pw.Expanded(
                                  flex: 7,
                                  child: pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text('1° PREMIO: ASADO COMPLETO',
                                          style: pw.TextStyle(
                                              fontSize: 10,
                                              fontWeight: pw.FontWeight.bold)),
                                      pw.Text('PARA 10 PERSONA',
                                          style: pw.TextStyle(
                                              fontSize: 10,
                                              fontWeight: pw.FontWeight.bold)),
                                      pw.SizedBox(height: 3),
                                      pw.Container(
                                        width: 230,
                                        height: 1,
                                        color: PdfColors.black,
                                        margin: const pw.EdgeInsets.symmetric(
                                            vertical: 2),
                                      ),
                                      pw.Text('2° PREMIO: ASADO COMPLETO',
                                          style: pw.TextStyle(
                                              fontSize: 10,
                                              fontWeight: pw.FontWeight.bold)),
                                      pw.Text('PARA 5 PERSONAS',
                                          style: pw.TextStyle(
                                              fontSize: 10,
                                              fontWeight: pw.FontWeight.bold)),
                                      pw.SizedBox(height: 3),
                                      pw.Container(
                                        width: 230,
                                        height: 1,
                                        color: PdfColors.black,
                                        margin: const pw.EdgeInsets.symmetric(
                                            vertical: 2),
                                      ),
                                      pw.Text('3° PREMIO: ASADO COMPLETO',
                                          style: pw.TextStyle(
                                              fontSize: 10,
                                              fontWeight: pw.FontWeight.bold)),
                                      pw.Text('PARA 5 PERSONAS',
                                          style: pw.TextStyle(
                                              fontSize: 10,
                                              fontWeight: pw.FontWeight.bold)),
                                      pw.SizedBox(height: 3),
                                      pw.Container(
                                        width: 230,
                                        height: 1,
                                        color: PdfColors.black,
                                        margin: const pw.EdgeInsets.symmetric(
                                            vertical: 2),
                                      ),
                                      pw.Text(
                                          'SORTEA EL DÍA 15/04/25 POR QUINIELA',
                                          style:
                                              const pw.TextStyle(fontSize: 10)),
                                      pw.Text('NOCTURNA DE SAN JUAN',
                                          style:
                                              const pw.TextStyle(fontSize: 10)),
                                    ],
                                  ),
                                ),
                                // Right side - Triple chance
                                pw.Expanded(
                                  flex: 3,
                                  child: pw.Container(
                                    padding: const pw.EdgeInsets.only(left: 10),
                                    child: pw.Column(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.center,
                                      children: [
                                        pw.Text('TRIPLE',
                                            style: pw.TextStyle(
                                                fontSize: 18,
                                                fontWeight:
                                                    pw.FontWeight.bold)),
                                        pw.Text('CHANCE',
                                            style: const pw.TextStyle(
                                                fontSize: 16)),
                                        pw.SizedBox(height: 5),
                                        pw.Text('VALOR: \$5.000',
                                            style: pw.TextStyle(
                                                fontSize: 10,
                                                fontWeight:
                                                    pw.FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // Explanation text
                            pw.SizedBox(height: 8),
                            pw.Container(
                              child: pw.Text(
                                'El motivo de este sorteo es recaudar fondos para abaratar los costos generales de la cena de fin de año. Los números serán asignados a todos los representantes de las distinta areas de la Dirección de Telecomunicaciones y Emergencias Policiales D-8 y al personal civil del CISEM 911. Los cartones pueden ser vendidos a cualquier persona, pertenezca o no a la institución. Habrá una planilla de control y transparencia que podrá ser consultada a quienes lo deseen. Este sorteo se realizará todos los meses, los días 15 de cada mes hasta diciembre, debiendo rendir el dinero de los números el día 14 sin falta. ¡Muchas gracias a todos por participar! ¡Mucha suerte!',
                                style: const pw.TextStyle(fontSize: 8),
                                textAlign: pw.TextAlign.justify,
                              ),
                            ),

                            // Por esto:
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
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Save and print PDF
  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}
