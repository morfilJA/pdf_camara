import 'package:pdf/widgets.dart' as pw;

class TicketHeader extends pw.StatelessWidget {
  final pw.MemoryImage image;
  final String ticketNumber;
  final String randomNumbers;

  TicketHeader({
    required this.image,
    required this.ticketNumber,
    required this.randomNumbers,
  });

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
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
              pw.Text('CARTÓN N°: $ticketNumber',
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.Text(randomNumbers,
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }
}
