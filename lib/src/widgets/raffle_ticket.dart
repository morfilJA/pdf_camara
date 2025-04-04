import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'vertical_info_column.dart';
import 'ticket_header.dart';
import 'prize_section.dart';
import 'ticket_footer.dart';

class RaffleTicket extends pw.StatelessWidget {
  final String ticketNumber;
  final String randomNumbers;
  final pw.MemoryImage image;

  RaffleTicket({
    required this.ticketNumber,
    required this.randomNumbers,
    required this.image,
  });

  @override
  pw.Widget build(pw.Context context) {
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
                  width: 80, // Mayor ancho para evitar compresión
                  child: VerticalInfoColumn(
                    ticketNumber: ticketNumber,
                    randomNumbers: randomNumbers,
                  ),
                ),

                // Dotted line separator
                pw.Container(
                  margin: const pw.EdgeInsets.only(
                      left: 10, right: 15), // Márgenes ampliados
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
                  child: pw.Padding(
                    padding:
                        const pw.EdgeInsets.only(left: 5), // Padding adicional
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        // Header with image and ticket numbers
                        TicketHeader(
                          image: image,
                          ticketNumber: ticketNumber,
                          randomNumbers: randomNumbers,
                        ),

                        pw.Divider(thickness: 1),

                        // Prize section
                        PrizeSection(),

                        // Footer with explanation and cutting line
                        TicketFooter(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
