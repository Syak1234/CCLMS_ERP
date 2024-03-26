import "dart:async";
import "package:cclms/example/list.dart";
import 'package:cclms/Fees/pdfview.dart';
import "package:cclms/splash.dart";
import "package:connectivity_plus/connectivity_plus.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import 'package:get/get.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'package:timezone/data/latest_all.dart' as tz;

void main() async {
  tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SharedPreferences sp;
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    sharedPreferences();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;

    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException {
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus = result;

    if (ConnectivityResult.none == _connectionStatus) {
      Get.snackbar(
          'You are not connected to internet.', 'Please check your connection',
          duration: const Duration(seconds: 10),
          icon: const Icon(
            Icons.wifi_off,
            color: Colors.white,
          ),
          mainButton: TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white),
              )),
          barBlur: 0,
          backgroundColor: Colors.black,
          colorText: Colors.white);
    }
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  bool theme = false;
  void sharedPreferences() async {
    sp = await SharedPreferences.getInstance();
    setState(() {
      theme = sp.getBool('theme') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: theme ? ThemeData.dark() : ThemeData.light(),
      // themeMode: ThemeMode.system,
    );
  }
}
