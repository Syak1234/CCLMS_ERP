// import 'dart:convert';
import 'feesdetailsmedthod.dart';
import 'package:cclms/Fees/feesinstallinfo.dart';
// import 'package:cclms/class/feesdetails.dart';
import 'package:cclms/getx.dart';
import 'package:cclms/textcolor/fontcolor.dart';
// import 'package:cclms/urllink.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails>
    with TickerProviderStateMixin {
  FeesDetail fees = FeesDetail();
  @override
  void initState() {
    super.initState();
    fees.fetchErpInstallmentFees();
  }

  Getx obj = Get.put(Getx());
  var selected1 = const Color.fromARGB(166, 148, 198, 240);
  var selected2 = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Obx(
        () => Scaffold(
          body: fees.obj.details.isNotEmpty
              ? ListView.builder(
                  itemCount: fees.obj.details.length,
                  itemBuilder: (context, index) {
                    var amount = fees.obj.details[index].amount -
                        fees.obj.details[index].payamount +
                        fees.obj.details[index].fine;
                    bool show = fees.obj.details[index].payamount != 0;
                    bool check = fees.obj.details[index].amount == amount;

                    return Container(
                      margin: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        // color: index % 2 == 0 ? selected1 : selected2,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12)),
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      ),
                      child: ListTile(
                          onTap: () {
                            showBottomSheet(
                                context: context,
                                builder: (context) {
                                  return BottomSheet(
                                      onClosing: () {},
                                      builder: (context) {
                                        return GestureDetector(
                                          child: FeesinstallInfo(
                                              fees.obj.details[index].id,
                                              fees.obj.details[index]
                                                  .fees_type),
                                          onVerticalDragStart: (_) {},
                                        );
                                      });
                                });
                            // obj.nodata.value = false;
                            // obj.fdetail.clear();

                            // Get.to(
                            //     () =>
                            // FeesinstallInfo(
                            //         fees.obj.details[index].id,
                            //         fees.obj.details[index].fees_type),
                            //     transition: Transition.leftToRight);
                          },
                          leading: Text(
                            '${index + 1}',
                            style: GoogleFonts.robotoSlab(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          title: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              fees.obj.details[index].fees_type.toLowerCase(),
                              // style: GoogleFonts.salsa(),
                              style: GoogleFonts.robotoSlab(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          subtitle: Text(fees.obj.details[index].due_date),
                          trailing: show
                              ? Text(
                                  check ? 'Completed' : 'Due $amount',
                                  // textScaler: const TextScaler.linear(1.6),
                                  style: GoogleFonts.robotoSlab(
                                      fontSize: 14,
                                      color: check
                                          ? Colors.green
                                          : Colors.deepOrange,
                                      fontWeight: FontWeight.bold),
                                )
                              : const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                )),
                    );
                  })

              // ? SingleChildScrollView(
              //     child:
              //      Column(
              //       children: [
              //         Container(
              //           color: FColor.color1,
              //           child: ListTile(
              //             title: Text(
              //               'Total payable amount',
              //               style: FColor.font2,
              //             ),
              //             trailing: Text(
              //               obj.details[0].payable_amount,
              //               textScaler: const TextScaler.linear(1.4),
              //             ),
              //           ),
              //         ),
              //         Container(
              //           color: FColor.color2,
              //           child: ListTile(
              //             title: Text(
              //               'Total received amount',
              //               style: FColor.font2,
              //             ),
              //             subtitle: Text('(${obj.details[0].in_words})'),
              //             trailing: Text(
              //               obj.details[0].received_amount,
              //               textScaler: const TextScaler.linear(1.4),
              //             ),
              //           ),
              //         ),
              //         Container(
              //           color: FColor.color1,
              //           child: ListTile(
              //             title: Text(
              //               'Received date',
              //               style: FColor.font2,
              //             ),
              //             trailing: Text(
              //               obj.details[0].received_date,
              //               textScaler: const TextScaler.linear(1.4),
              //             ),
              //           ),
              //         ),
              //         Container(
              //           color: FColor.color2,
              //           child: ListTile(
              //             title: Text(
              //               'Received in',
              //               style: FColor.font2,
              //             ),
              //             trailing: Text(
              //               obj.details[0].received_in,
              //               textScaler: const TextScaler.linear(1.4),
              //             ),
              //           ),
              //         ),
              //         Container(
              //           color: FColor.color1,
              //           child: ListTile(
              //             title: Text(
              //               'Discount',
              //               style: FColor.font2,
              //             ),
              //             trailing: Text(
              //               obj.details[0].discount,
              //               textScaler: const TextScaler.linear(1.4),
              //             ),
              //           ),
              //         ),
              //         Container(
              //           color: FColor.color2,
              //           child: ListTile(
              //             title: Text(
              //               'Due',
              //               style: FColor.font2,
              //             ),
              //             trailing: Text(
              //               obj.details[0].due,
              //               textScaler: const TextScaler.linear(1.4),
              //             ),
              //           ),
              //         ),
              //         Container(
              //           color: FColor.color1,
              //           child: ListTile(
              //             title: Text(
              //               'Fine',
              //               style: FColor.font2,
              //             ),
              //             trailing: Text(
              //               obj.details[0].fine,
              //               textScaler: const TextScaler.linear(1.4),
              //             ),
              //           ),
              //         ),
              //         Container(
              //           color: FColor.color2,
              //           child: ListTile(
              //             title: Text(
              //               'Next payment date',
              //               style: FColor.font2,
              //             ),
              //             trailing: Text(
              //               obj.details[0].next_date,
              //               textScaler: const TextScaler.linear(1.4),
              //             ),
              //           ),
              //         ),
              //         Container(
              //           color: FColor.color1,
              //           child: ListTile(
              //             title: Text(
              //               'Memo id',
              //               style: FColor.font2,
              //             ),
              //             trailing: Text(
              //               obj.details[0].memo_id,
              //               textScaler: const TextScaler.linear(1.4),
              //             ),
              //           ),
              //         ),
              //         Container(
              //           color: FColor.color2,
              //           child: ListTile(
              //             title: Text(
              //               'Diposite in',
              //               style: FColor.font2,
              //             ),
              //             trailing: Text(
              //               obj.details[0].deposit_to,
              //               textScaler: const TextScaler.linear(1.4),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   )

              : Center(
                  child: fees.obj.nodata.value
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
        ),
      ),
    );
  }
}
