// import 'dart:typed_data';
// ignore_for_file: avoid_print

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../models/raffle_number_generator.dart';
import '../widgets/raffle_ticket.dart';

class PdfService {
  static Future<void> generateRaffleTickets({
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
            return RaffleTicket(
              ticketNumber: formattedTicketNumber,
              randomNumbers: randomNumbers,
              image: image,
            );
          },
        ),
      );

      // Para mostrar progreso, imprime cada 100 cartones generados
      if (ticketNumber % 100 == 0) {
        print(ticketNumber);
      }
    }

    // Save and print PDF
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}
