import 'dart:convert';
import 'package:cclms/class/feesdetails.dart';
import 'package:cclms/class/intalldetails.dart';
import 'package:cclms/getx.dart';
import 'package:cclms/textcolor/fontcolor.dart';
import 'package:cclms/urllink.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pdfview.dart';
class FeesinstallInfo extends StatefulWidget {
  String id;
  String fees_type;
  FeesinstallInfo(this.id, this.fees_type, {super.key});

  @override
  State<FeesinstallInfo> createState() => _FeesinstallInfoState();
}

class _FeesinstallInfoState extends State<FeesinstallInfo> {
  late SharedPreferences sp;

  Getx obj = Get.put(Getx());
  @override
  void initState() {
    feesdetails(widget.id);
    // TODO: implement initState
    super.initState();
  }

  Future feesdetails(installment_fees_type_id) async {
    try {
      obj.receivedpayment.value = 0;
      sp = await SharedPreferences.getInstance();
      Map data = {
        'student_id': sp.getString('id'),
        'installment_fees_type_id': installment_fees_type_id
      };
      final token = sp.getString('token');

      await post(Uri.parse('${UrlLink.baseurl}student/feesInstallment'),
              headers: {
                // "Content-Type": "application/json",
                'Authorization': 'Bearer $token',
              },
              encoding: Encoding.getByName("utf-8"),
              body: data)
          .then((response) {
        // print(response.body);
        var jsondata = jsonDecode(response.body);
        obj.fdetail.clear();
        if (response.statusCode == 200) {
          // print(jsondata);
          if (jsondata['status'] == 1) {
            for (int i = 0; i < jsondata['info'].length; i++) {
              FeesInfo data = FeesInfo(
                memo_id: jsondata['info'][i]['memo_id'].toString(),
                payable_amount:
                    jsondata['info'][i]['payable_amount'].toString(),
                received_amount:
                    jsondata['info'][i]['received_amount'].toString(),
                in_words: jsondata['info'][i]['in_words'].toString(),
                discount: jsondata['info'][i]['discount'].toString(),
                fine: jsondata['info'][i]['fine'].toString(),
                due: jsondata['info'][i]['due'].toString(),
                received_date: jsondata['info'][i]['received_date'].toString(),
                deposit_to: jsondata['info'][i]['deposit_to'].toString(),
                received_in: jsondata['info'][i]['received_in'].toString(),
                remaining_course_fees:
                    jsondata['info'][i]['remaining_course_fees'].toString(),
                College_id: jsondata['info'][i]['college_id'],
              );

              obj.fdetail.add(data);
              obj.receivedpayment.value +=
                  int.parse(obj.fdetail[i].received_amount);
            }
            obj.totalpayment.value = int.parse(obj.fdetail[0].payable_amount);
          } else {
            obj.nodata.value = true;
          }
        }
      });
    } catch (e) {
      obj.nodata.value = true;
    }
  }

  // late TabController _tabController;

  final selectedColor1 = Color.fromARGB(255, 154, 197, 233);
  final selectedColor2 = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Obx(
        () => DefaultTabController(
          length: 1,
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.to(() => PdfPreviewPage(
                      obj.fdetail,
                      widget.fees_type,
                    ));
              },
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.file_download,
                color: Colors.white,
              ),
            ),
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.blue,
              title: Text(
                widget.fees_type,
                style: GoogleFonts.salsa(color: Colors.white, fontSize: 25),
                // textScaler: TextScaler.linear(1.5),
              ),
            ),
            body: obj.fdetail.isNotEmpty
                ? ListView.builder(
                    itemCount: obj.fdetail.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            border: Border.fromBorderSide(
                                BorderSide(color: Colors.blueGrey, width: 2))),
                        // color: Color.fromARGB(255, 255, 255, 255),
                        child: ListBody(
                          mainAxis: Axis.vertical,
                          // reverse: true,
                          children: [
                            ListTile(
                              title: Text(
                                'Memo id',
                                style: FColor.font2,
                              ),
                              trailing: Text(
                                obj.fdetail[index].memo_id,
                                style: FColor.font,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'College id',
                                style: FColor.font2,
                              ),
                              trailing: Text(
                                obj.fdetail[index].College_id,
                                style: FColor.font,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'Payable amount',
                                style: FColor.font2,
                              ),
                              trailing: Text(
                                obj.fdetail[index].payable_amount,
                                style: FColor.font,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'Received amount',
                                style: FColor.font2,
                              ),
                              trailing: Text(
                                obj.fdetail[index].received_amount,
                                style: FColor.font,
                              ),
                              subtitle: Text(
                                '(${obj.fdetail[index].in_words})',
                                style: FColor.font2,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'Discount',
                                style: FColor.font2,
                              ),
                              trailing: Text(
                                obj.fdetail[index].discount,
                                style: FColor.font,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'Fine',
                                style: FColor.font2,
                              ),
                              trailing: Text(
                                obj.fdetail[index].fine,
                                style: FColor.font,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'Due',
                                style: FColor.font2,
                              ),
                              trailing: Text(
                                obj.fdetail[index].due,
                                style: FColor.font,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'Received date',
                                style: FColor.font2,
                              ),
                              trailing: Text(
                                obj.fdetail[index].received_date,
                                style: FColor.font,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'Deposit to',
                                style: FColor.font2,
                              ),
                              trailing: Container(
                                child: Text(
                                  obj.fdetail[index].deposit_to,
                                  overflow: TextOverflow.ellipsis,
                                  style: FColor.font,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : Center(
                    child: obj.nodata.value
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/img/empty.png',
                                width: 200,
                              ),
                              Text(
                                'No data',
                                style: FColor.font2,
                              )
                            ],
                          )
                        : const CircularProgressIndicator()),

            // SingleChildScrollView(
            //   child: Column(
            //     children: [
            //       Container(
            //         color: FColor.color1,
            //         child: ListTile(
            //           title: Text(
            //             'Total payable amount',
            //             style: FColor.font2,
            //           ),
            //           trailing: Text(
            //            widget.details[0].id,
            //             textScaler: const TextScaler.linear(1.4),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         color: FColor.color2,
            //         child: ListTile(
            //           title: Text(
            //             'Total received amount',
            //             style: FColor.font2,
            //           ),
            //           subtitle: Text('(${obj.details[0].in_words})'),
            //           trailing: Text(
            //             obj.details[0].received_amount,
            //             textScaler: const TextScaler.linear(1.4),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         color: FColor.color1,
            //         child: ListTile(
            //           title: Text(
            //             'Received date',
            //             style: FColor.font2,
            //           ),
            //           trailing: Text(
            //             obj.details[0].received_date,
            //             textScaler: const TextScaler.linear(1.4),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         color: FColor.color2,
            //         child: ListTile(
            //           title: Text(
            //             'Received in',
            //             style: FColor.font2,
            //           ),
            //           trailing: Text(
            //             obj.details[0].received_in,
            //             textScaler: const TextScaler.linear(1.4),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         color: FColor.color1,
            //         child: ListTile(
            //           title: Text(
            //             'Discount',
            //             style: FColor.font2,
            //           ),
            //           trailing: Text(
            //             obj.details[0].discount,
            //             textScaler: const TextScaler.linear(1.4),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         color: FColor.color2,
            //         child: ListTile(
            //           title: Text(
            //             'Due',
            //             style: FColor.font2,
            //           ),
            //           trailing: Text(
            //             obj.details[0].due,
            //             textScaler: const TextScaler.linear(1.4),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         color: FColor.color1,
            //         child: ListTile(
            //           title: Text(
            //             'Fine',
            //             style: FColor.font2,
            //           ),
            //           trailing: Text(
            //             obj.details[0].fine,
            //             textScaler: const TextScaler.linear(1.4),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         color: FColor.color2,
            //         child: ListTile(
            //           title: Text(
            //             'Next payment date',
            //             style: FColor.font2,
            //           ),
            //           trailing: Text(
            //             obj.details[0].next_date,
            //             textScaler: const TextScaler.linear(1.4),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         color: FColor.color1,
            //         child: ListTile(
            //           title: Text(
            //             'Memo id',
            //             style: FColor.font2,
            //           ),
            //           trailing: Text(
            //             obj.details[0].memo_id,
            //             textScaler: const TextScaler.linear(1.4),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         color: FColor.color2,
            //         child: ListTile(
            //           title: Text(
            //             'Diposite in',
            //             style: FColor.font2,
            //           ),
            //           trailing: Text(
            //             obj.details[0].deposit_to,
            //             textScaler: const TextScaler.linear(1.4),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
