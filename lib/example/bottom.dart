import 'package:flutter/material.dart';

import '../Fees/paymentdetails.dart';
import '../Fees/upcomingPayment.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue,
            ),
            child: const TabBar(
                padding: EdgeInsets.symmetric(horizontal: 0),
                labelPadding: EdgeInsets.symmetric(horizontal: 0),
                isScrollable: false,
                dividerColor: Colors.white,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                dividerHeight: 30,
                tabs: <Widget>[
                  Tab(
                    icon: Icon(
                      Icons.payment,
                      size: 20,
                    ),
                    text: 'Payment details',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.history,
                      size: 20,
                    ),
                    text: 'Upcoming installment',
                  )
                ]),
          ),
         
         
          body: const TabBarView(
            children: [
              PaymentDetails(),
              HistoryDetails(),
            ],
          ),
        ),
      ),
    );
  }
}
