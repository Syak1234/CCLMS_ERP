import 'dart:io';

import 'package:cclms/class/feesdetails.dart';
// import 'package:cclms/example/pdfClass.dart';
// import 'package:cclms/textcolor/fontcolor.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class PdfPreviewPage extends StatelessWidget {
  late RxList<FeesInfo> invoice;
  // ignore: non_constant_identifier_names
  late String fees_type;
  PdfPreviewPage(
    this.invoice,
    this.fees_type, {
    super.key,
  });
  late SharedPreferences sp;
  RxString pdfname = ''.obs;
  Future<Uint8List> makePdf(
      RxList<FeesInfo> invoice, BuildContext context) async {
    sp = await SharedPreferences.getInstance();
    pdfname.value = sp.getString('id') ?? '';

    var font = await PdfGoogleFonts.rasaMedium();
    var signfont = await PdfGoogleFonts.dancingScriptBold();

    final image = pw.MemoryImage((await rootBundle.load(
      'assets/img/logocclms.png',
    ))
        .buffer
        .asUint8List());
    final pdf = pw.Document();

    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(15),
        build: (context) => [
              for (int index = 0; index < invoice.length; index++)
                pw.Partition(
                  flex: 5,
                  child: pw.Center(
                      heightFactor: 3,
                      child: pw.Container(
                          margin: const pw.EdgeInsets.all(0),
                          padding: const pw.EdgeInsets.only(left: 7, right: 7),
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.grey)),
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Header(
                                    // level: 2,
                                    child: pw.Container(
                                  color: PdfColors.blue100,
                                  child: pw.Row(children: [
                                    pw.Image(image, width: 50, height: 50),
                                    pw.Expanded(
                                        child: pw.Container(
                                            child: pw.Column(children: [
                                      pw.Padding(
                                        padding: const pw.EdgeInsets.symmetric(
                                            vertical: 3),
                                        child: pw.Text(
                                            'Contai College of Learning & Management Science',
                                            textAlign: pw.TextAlign.center,
                                            style: pw.TextStyle(
                                                fontWeight: pw.FontWeight.bold,
                                                fontSize: 20,
                                                font: font)),
                                      ),
                                      pw.Text(
                                          'Affiliated to:MAKAUT, College Code:340',
                                          style: pw.TextStyle(
                                              fontSize: 13, font: font)),
                                      pw.Text(
                                          'Padmapukuria :: Contai :: Purba Medinipur :: W.B(721401)',
                                          style: pw.TextStyle(
                                              fontSize: 13, font: font))
                                    ])))
                                  ]),
                                )),
                                // pw.Row(
                                //   // mainAxisAlignment: pw.MainAxisAlignment.center,
                                //   children: [
                                //     pw.Container(
                                //       // color: PdfColors.amber,
                                //       padding: pw.EdgeInsets.only(),
                                //       // child: ,
                                //     ),
                                //   ],
                                // ),
                                // pw.Container(color: PdfColors.amber),
                                pw.Divider(height: 2, color: PdfColors.grey),
                                pw.Divider(height: 2, color: PdfColors.grey),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceBetween,
                                    children: [
                                      pw.Container(
                                          margin:
                                              const pw.EdgeInsets.only(top: 10),
                                          // alignment: pw.Alignment.center,
                                          padding: const pw.EdgeInsets.only(
                                              left: 5, top: 3, bottom: 3),
                                          width: 170,
                                          color: PdfColors.blue100,
                                          child: pw.Text('Received From:',
                                              style: pw.TextStyle(
                                                  font: font,
                                                  fontWeight:
                                                      pw.FontWeight.bold))),
                                      pw.Container(
                                          margin:
                                              const pw.EdgeInsets.only(top: 10),
                                          // alignment: pw.Alignment.center,
                                          padding: const pw.EdgeInsets.only(
                                              left: 5, top: 3, bottom: 3),
                                          // width: 170,
                                          color: PdfColors.blue100,
                                          child: pw.Text(invoice[index].memo_id,
                                              style: pw.TextStyle(
                                                  font: font,
                                                  fontWeight:
                                                      pw.FontWeight.bold)))
                                    ]),

                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceEvenly,
                                    children: [
                                      pw.Expanded(
                                          child: pw.ListView(
                                              direction: pw.Axis.vertical,
                                              children: [
                                            pw.Row(children: [
                                              pw.Container(
                                                  child: pw.Text('Sayak Mishra',
                                                      style: pw.TextStyle(
                                                          font: font))),
                                            ]),
                                            pw.Row(children: [
                                              pw.Container(
                                                  child: pw.Text(
                                                      'College ID:${invoice[index].College_id}',
                                                      style: pw.TextStyle(
                                                          font: font))),
                                            ]),
                                            pw.Row(children: [
                                              pw.Container(
                                                  child: pw.Text('Course:',
                                                      style: pw.TextStyle(
                                                          font: font))),
                                            ]),
                                            pw.Row(children: [
                                              pw.Container(
                                                  child: pw.Text('Batch:',
                                                      style: pw.TextStyle(
                                                          font: font))),
                                            ]),
                                            pw.Row(children: [
                                              pw.Container(
                                                  child: pw.Text(
                                                      'Adademic Year:',
                                                      style: pw.TextStyle(
                                                          font: font))),
                                            ]),
                                            pw.Row(children: [
                                              pw.Container(
                                                  child: pw.Text(
                                                      'Installment Type:',
                                                      style: pw.TextStyle(
                                                          font: font))),
                                            ]),
                                            pw.Row(children: [
                                              pw.Container(
                                                  child: pw.Text(
                                                      'Installment Amount:${invoice[index].payable_amount}',
                                                      style: pw.TextStyle(
                                                          font: font))),
                                            ])
                                          ])),
                                      // pw.Column(children: [
                                      // },
                                      // ]),
                                      // pw.Column(children: [
                                      pw.Expanded(
                                          child: pw.ListView(
                                              direction: pw.Axis.vertical,
                                              children: [
                                            // itemBuilder: (context, index) {

                                            pw.Row(children: [
                                              pw.Container(
                                                  child: pw.Text(
                                                      'Receipt Date:${DateTime.now()}',
                                                      style: pw.TextStyle(
                                                          font: font))),
                                            ]),
                                            pw.Row(children: [
                                              pw.Container(
                                                  child: pw.Text(
                                                      'Deposite to:${invoice[index].deposit_to}',
                                                      style: pw.TextStyle(
                                                          font: font))),
                                            ]),
                                            pw.Row(children: [
                                              pw.Container(
                                                  child: pw.Text(
                                                      'Installment Due:${invoice[index].due}',
                                                      style: pw.TextStyle(
                                                          font: font))),
                                            ]),
                                            pw.Row(children: [
                                              pw.Container(
                                                  child: pw.Text(
                                                      'Fine Applied:${invoice[index].fine}',
                                                      style: pw.TextStyle(
                                                          font: font))),
                                            ]),

                                            pw.Row(children: [
                                              pw.Container(
                                                  child: pw.Text(
                                                      'Discount:${invoice[index].discount}',
                                                      style: pw.TextStyle(
                                                          font: font))),
                                            ]),
                                            pw.Row(children: [
                                              pw.Container(
                                                  child: pw.Text(
                                                      'Total Payable:${invoice[index].received_amount}',
                                                      style: pw.TextStyle(
                                                          font: font))),
                                            ])
                                          ])), // },

                                      // ])
                                    ]),
                                pw.Container(
                                    alignment: pw.Alignment.center,
                                    width: 400,
                                    padding: const pw.EdgeInsets.symmetric(
                                        vertical: 2),
                                    color: PdfColors.blue100,
                                    child: pw.Text(
                                        'Amount paid: ${invoice[index].received_amount} rupees',
                                        style: pw.TextStyle(
                                            font: font,
                                            fontWeight: pw.FontWeight.bold,
                                            fontSize: 14))),
                                pw.Container(
                                    alignment: pw.Alignment.center,
                                    width: 400,
                                    padding: const pw.EdgeInsets.symmetric(
                                        vertical: 2),
                                    child: pw.Text(
                                        invoice[index].in_words.toUpperCase(),
                                        style: pw.TextStyle(
                                          fontSize: 11,
                                          font: font,
                                        ))),

                                pw.Divider(height: 2, color: PdfColors.grey),

                                pw.Container(
                                  color: PdfColors.blue100,
                                  child: pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.spaceBetween,
                                      children: [
                                        pw.Text(
                                            'Installment Due:${invoice[index].due}',
                                            style: pw.TextStyle(
                                              font: font,
                                            )),
                                        pw.Text(
                                            'Remaining Course Fees:${invoice[index].remaining_course_fees}',
                                            style: pw.TextStyle(
                                              font: font,
                                            ))
                                      ]),
                                ),
                                pw.Divider(height: 2, color: PdfColors.grey),

                                pw.Row(children: [
                                  pw.Container(
                                      child: pw.Text('TERMS & CONDITIONS:',
                                          style: pw.TextStyle(
                                            color: PdfColors.red,
                                            fontWeight: pw.FontWeight.bold,
                                          )))
                                ]),
                                pw.Column(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Row(children: [
                                        pw.Container(
                                          padding: const pw.EdgeInsets.only(
                                              left: 12),
                                          child: pw.Text(
                                              '1. Fees once paid is not refundable under any circumstances(Except remain unsuccessful\n in HS Examination ${DateTime.now().year}).',
                                              overflow: pw.TextOverflow.visible,
                                              style: pw.TextStyle(
                                                fontSize: 8,
                                                font: font,
                                              )),
                                        ),
                                      ]),
                                      pw.Row(children: [
                                        pw.Container(
                                          padding: const pw.EdgeInsets.only(
                                              left: 12),
                                          child: pw.Text(
                                              '2. Seat Booking amount is valid till the publication of Online H.S Result',
                                              overflow: pw.TextOverflow.visible,
                                              style: pw.TextStyle(
                                                fontSize: 8,
                                                font: font,
                                              )),
                                        )
                                      ]),
                                      pw.Row(children: [
                                        pw.Container(
                                          padding: const pw.EdgeInsets.only(
                                              left: 12),
                                          child: pw.Text(
                                              '3. The student should strictly adhere to the batch /schedule timings specified by the College.',
                                              overflow: pw.TextOverflow.visible,
                                              style: pw.TextStyle(
                                                fontSize: 8,
                                                font: font,
                                              )),
                                        )
                                      ]),
                                      pw.Row(children: [
                                        pw.Container(
                                          padding: const pw.EdgeInsets.only(
                                              left: 12),
                                          child: pw.Text(
                                              '4. The student is expected to produce this receipt at the time of collecting the coollecting the course\ncompletion certificate.',
                                              overflow: pw.TextOverflow.visible,
                                              style: pw.TextStyle(
                                                fontSize: 8,
                                                font: font,
                                              )),
                                        )
                                      ])
                                    ]),
                                pw.Row(
                                    mainAxisAlignment: pw.MainAxisAlignment.end,
                                    children: [
                                      pw.Column(children: [
                                        pw.Image(image, width: 50, height: 50),
                                        pw.Text(
                                            'Digitally sign,no need to sign',
                                            style: pw.TextStyle(
                                              font: signfont,
                                              color: PdfColors.red,
                                              fontWeight: pw.FontWeight.bold,
                                            ))
                                      ])
                                    ])
                              ]))),
                )
            ]));
    // }
    // },
    // itemCount: invoice.length);

    // } else {
    //   pdf.addPage(pw.Page(
    //     build: (context) => pw.Container(),
    //   ));
    // }
    //  final directory = await getExternalStorageDirectory();
    final externalDir = await getExternalStorageDirectory();
    final externalPath = externalDir!.path;
    // print(externalPath);
    final pdfFile = File('$externalPath/AA.pdf');
    await pdfFile.writeAsBytes(await pdf.save());

    final Uint8List uint8List = await pdfFile.readAsBytes();

    return uint8List;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => PdfPreview(
          canDebug: false,
          allowPrinting: false,
          // canChangeOrientation: false,
          // canChangePageFormat: false,
          // dpi: 500,
          dynamicLayout: true,
          loadingWidget: const CircularProgressIndicator(
            color: Colors.black,
          ),
          // maxPageWidth: 600,
          // pdfPreviewPageDecoration: BoxDecoration(
          //     border: Border.all(color: Colors.black), color: Colors.blue),
          // ignore: prefer_interpolation_to_compose_strings
          pdfFileName: fees_type + '_' + pdfname.value + ".pdf",

          build: (format) => makePdf(invoice, context),
        ),
      ),
    );
  }
}
