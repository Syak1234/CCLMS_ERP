import 'package:cclms/Fees/upcomingPayment.dart';
import 'package:cclms/Fees/paymentdetails.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeesDetails extends StatefulWidget {
  const FeesDetails({super.key});

  @override
  State<FeesDetails> createState() => _FeesDetailsState();
}

class _FeesDetailsState extends State<FeesDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              // shape: const RoundedRectangleBorder(
              //   borderRadius: BorderRadius.vertical(
              //     bottom: Radius.circular(30),
              //   ),
              // ),
              backgroundColor: Colors.blue,
              title: Text(
                'Fees',
                style: GoogleFonts.salsa(color: Colors.white, fontSize: 16),
                textScaler: const TextScaler.linear(2),
              ),
              bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(50),
                  child: TabBar(
                      // indicatorColor: Colors.red,
                      // // indicator: UnderlineTabIndicator(),
                      // padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      // labelPadding:
                      //     EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      // isScrollable: false,
                      // dividerColor: Colors.black38,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      // labelStyle: TextStyle(fontSize: 12),
                      tabs: <Widget>[
                        Tab(
                          icon: Icon(
                            Icons.payment,
                            // size: 20,
                          ),
                          text: 'Payment details',
                        ),
                        Tab(
                          icon: Icon(
                            Icons.history,
                            // size: 20,
                          ),
                          text: 'Upcoming installment',
                        )
                      ])),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterFloat,
            // persistentFooterButtons: [Text('data'), Text('data')],

            // : BottomAppBar(
            //     surfaceTintColor: Colors.transparent,
            //     color: Colors.transparent,
            //     shadowColor: Colors.transparent,
            //     child:),
            body: const TabBarView(
              children: [
                PaymentDetails(),
                HistoryDetails(),
              ],
            )),
      ),
    );
  }
}
