// ignore: file_names
import 'dart:convert';

import 'package:cclms/class/feesdetails.dart';
import 'package:cclms/urllink.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cclms/textcolor/fontcolor.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'feesdetailsmedthod.dart';

class HistoryDetails extends StatefulWidget {
  const HistoryDetails({super.key});

  @override
  State<HistoryDetails> createState() => _HistoryDetailsState();
}

class _HistoryDetailsState extends State<HistoryDetails> {
  FeesDetail fees = FeesDetail();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(),
    );
  }
}
