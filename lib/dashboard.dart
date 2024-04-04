// import 'package:cclms/backgroundcolor/bgcolor.dart';
import 'dart:ffi';
import 'dart:io';

import 'package:cclms/Fees/fees_details.dart';
import 'package:cclms/attendence/student_attendence.dart';
import 'package:cclms/erplogin.dart';
import 'package:cclms/getx.dart';
import 'package:cclms/textcolor/fontcolor.dart';
import 'package:cclms/class/userDetails.dart';
import 'package:cclms/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:switcher_button/switcher_button.dart';
import 'package:toast/toast.dart';

import 'cv/cv_home.dart';

// ignore: must_be_immutable
class DashBoard extends StatefulWidget {
  UserDetails details;
  DashBoard(this.details, {super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}

class _DashBoardState extends State<DashBoard> {
  var obj = Get.put(Getx());

  // final LocalAuthentication auth = LocalAuthentication();
  // _SupportState _supportState = _SupportState.unknown;
  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;
  List<UserDetails> list = [];
  late SharedPreferences sp;
  @override
  void initState() {
    super.initState();

    sharedPreferences().whenComplete(() => list.add(widget.details));

    // else{
    //   _
    // }
  }

  Future<void> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
    print(_canCheckBiometrics);
  }

  Future<void> _getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
    print(_availableBiometrics);
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        // authMessages:,
        localizedReason: 'Use your fingerprint to continue',
        options: const AuthenticationOptions(
            stickyAuth: true, biometricOnly: true, useErrorDialogs: true),
      );
      authenticated ? '' : SystemNavigator.pop();
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      // exit(0);
    }
    if (!mounted) {
      return;
    }

    setState(
        () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
    ToastContext().init(context);
    authenticated
        ? Toast.show(
            'Authorized',
            backgroundColor: Colors.green,
            textStyle: TextStyle(color: Colors.white),
          )
        : Toast.show('Not Authorized',
            backgroundColor: Colors.red,
            textStyle: TextStyle(color: Colors.white));
  }

  // Future<void> _authenticateWithBiometrics() async {
  //   bool authenticated = false;
  //   try {
  //     setState(() {
  //       _isAuthenticating = true;
  //       _authorized = 'Authenticating';
  //     });
  //     authenticated = await auth.authenticate(
  //       localizedReason:
  //           'Scan your fingerprint (or face or whatever) to authenticate',
  //       options: const AuthenticationOptions(
  //         stickyAuth: true,
  //         biometricOnly: true,
  //       ),
  //     );
  //     setState(() {
  //       _isAuthenticating = false;
  //       _authorized = 'Authenticating';
  //     });
  //   } on PlatformException catch (e) {
  //     print(e);
  //     setState(() {
  //       _isAuthenticating = false;
  //       _authorized = 'Error - ${e.message}';
  //     });
  //     return;
  //   }
  //   if (!mounted) {
  //     return;
  //   }

  //   final String message = authenticated ? 'Authorized' : 'Not Authorized';
  //   setState(() {
  //     _authorized = message;
  //   });
  // }

  Future<void> _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }

  // Future<void> _checkBiometrics() async {
  //   try {
  //     obj.canCheckBiometrics.value = await auth.canCheckBiometrics;
  //   } on PlatformException catch (e) {
  //     obj.canCheckBiometrics.value = false;
  //     print(e);
  //   }
  //   if (!mounted) {
  //     return;
  //   }

  //   obj.canbeCheckBiometrics?.value = obj.canCheckBiometrics.value;
  //   print(obj.canbeCheckBiometrics?.value);
  // }

  // Future<void> _getAvailableBiometrics() async {
  //   late List<BiometricType> availableBiometrics;
  //   try {
  //     availableBiometrics = await auth.getAvailableBiometrics();
  //   } on PlatformException catch (e) {
  //     availableBiometrics = <BiometricType>[];
  //     print(e);
  //   }
  //   if (!mounted) {
  //     return;
  //   }

  //   // setState(() {
  //   obj.availableBiometrics?.value = availableBiometrics;
  //   // });
  //   print(obj.availableBiometrics);
  // }

  // Future<void> _authenticate() async {
  //   bool authenticated = false;
  //   try {
  //     // setState(() {
  //     obj.isAuthenticating.value = true;
  //     obj.authorized.value = 'Authenticating';
  //     // });
  //     authenticated = await auth.authenticate(
  //       localizedReason: 'Let OS determine authentication method',
  //       options: const AuthenticationOptions(
  //         stickyAuth: true,
  //       ),
  //     );
  //     // setState(() {
  //     obj.isAuthenticating.value = false;
  //     // });
  //   } on PlatformException catch (e) {
  //     print(e);

  //     obj.isAuthenticating.value = false;
  //     obj.authorized.value = 'Error - ${e.message}';

  //     return;
  //   }
  //   if (!mounted) {
  //     return;
  //   }

  //   obj.authorized.value = authenticated ? 'Authorized' : 'Not Authorized';
  // }

  // Future<void> _authenticateWithBiometrics() async {
  //   bool authenticated = false;
  //   try {
  //     obj.isAuthenticating.value = true;
  //     obj.authorized.value = 'Authenticating';

  //     authenticated = await auth.authenticate(
  //       localizedReason:
  //           'Scan your fingerprint (or face or whatever) to authenticate',
  //       options: const AuthenticationOptions(
  //         stickyAuth: true,
  //         biometricOnly: true,
  //       ),
  //     );

  //     obj.isAuthenticating.value = false;
  //     obj.authorized.value = 'Authenticating';
  //   } on PlatformException catch (e) {
  //     print(e);

  //     obj.isAuthenticating.value = false;
  //     obj.authorized.value = 'Error - ${e.message}';

  //     return;
  //   }
  //   if (!mounted) {
  //     return;
  //   }

  //   final String message = authenticated ? 'Authorized' : 'Not Authorized';
  //   // setState(() {
  //   obj.authorized.value = message;
  //   // });
  // }

  // Future<void> _cancelAuthentication() async {
  //   await auth.stopAuthentication();
  //   obj.isAuthenticating.value = false;
  // }

  late bool toggle = false;
  // late bool checkfinger = false;
  Future sharedPreferences() async {
    sp = await SharedPreferences.getInstance();
    toggle = sp.getBool('theme') ?? false;

    print(sp.getString('token'));
    print(sp.getString('college_id'));

    obj.toggleButtonChange(toggle);
    obj.finger.value = sp.getBool('finger') ?? false;

    print(obj.finger.value);
    if (obj.finger.value == true) {
      _authenticate();
    } else {
      auth
          .isDeviceSupported()
          .then(
            (bool isSupported) => setState(() => _supportState = isSupported
                ? _SupportState.supported
                : _SupportState.unsupported),
          )
          .whenComplete(() =>
              _checkBiometrics().whenComplete(() => _getAvailableBiometrics()));
    }
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width - 70,
                child: ListTile(
                  title: Text(
                    'Unlock with fingerprint',
                    style: FColor.font2,
                    textScaler: TextScaler.linear(1.2),
                  ),
                  trailing: Obx(
                    () => SwitcherButton(
                      // size: 100,

                      offColor: Colors.black,
                      onColor: Colors.blue,
                      key: UniqueKey(),
                      value: obj.finger.value,
                      size: 65,

                      onChange: (value) {
                        // obj.toggleButtonChange(value);
                        // Get.changeTheme(
                        //   value ? ThemeData.dark() : ThemeData.light(),
                        // );
                        obj.fingercheck(value);
                        obj.finger.value
                            ? _authenticate()
                            : _cancelAuthentication();
                        sp.setBool('finger', value);
                      },
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        key: scaffoldKey,
        drawer: drawer(),
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              if (scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.closeEndDrawer();
              } else {
                scaffoldKey.currentState!.openDrawer();
              }
            },
            child: InkWell(
              // onTap: () {
              //   Get.defaultDialog(
              //       title: 'token', content: Text(widget.details.token));
              // },
              child: const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
                ),
              ),
            ),
          ),
          title: Text(
            'Dashboard',
            style: FColor.font,
            textScaler: const TextScaler.linear(2),
          ),
          actions: [
            Obx(
              () => SwitcherButton(
                // size: 100,

                offColor: Colors.blue,
                onColor: Colors.white,
                key: UniqueKey(),
                value: obj.togglebuttonValue.value,
                size: 80,

                onChange: (value) {
                  obj.toggleButtonChange(value);
                  Get.changeTheme(
                    value ? ThemeData.dark() : ThemeData.light(),
                  );
                  sp.setBool('theme', value);
                },
              ),
            ),
            IconButton(
                onPressed: () async {
                  sp = await SharedPreferences.getInstance();
                  setState(() {
                    sp.remove('login');
                  });
                  // ignore: use_build_context_synchronously
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const ErpLogin()),
                      (Route<dynamic> route) => false);
                },
                icon: Image.asset('assets/img/power.png'))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.blue[100],
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(
                                  () => UserProfile(
                                        widget.details,
                                      ),
                                  transition: Transition.leftToRight);
                            },
                            child: Card(
                              child: Container(
                                width: MediaQuery.sizeOf(context).width / 3.6,
                                // height: MediaQuery.sizeOf(context).height / 7,
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/img/boy.png',
                                      width: 50,
                                    ),
                                    Text(
                                      'Profile',
                                      style: FColor.font,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => const CvHome(),
                                  transition: Transition.leftToRight);
                            },
                            child: Card(
                              child: Container(
                                width: MediaQuery.sizeOf(context).width / 3.6,
                                // height: MediaQuery.sizeOf(context).height / 7,
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/img/curriculum-vitae.png',
                                      width: 50,
                                    ),
                                    Text(
                                      'CV',
                                      style: FColor.font,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => const FeesDetails(),
                                  transition: Transition.leftToRight);
                            },
                            child: Card(
                              child: Container(
                                width: MediaQuery.sizeOf(context).width / 3.6,
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/img/scholarship.png',
                                      width: 50,
                                    ),
                                    Text(
                                      'Fees',
                                      style: FColor.font,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            child: Container(
                              width: MediaQuery.sizeOf(context).width / 3.6,
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/img/google-docs.png',
                                    width: 50,
                                  ),
                                  Text(
                                    'Documents',
                                    style: FColor.font,
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => const StudentAttendence(),
                                  transition: Transition.leftToRight);
                            },
                            child: Card(
                              child: Container(
                                width: MediaQuery.sizeOf(context).width / 3.6,
                                // height: MediaQuery.sizeOf(context).height / 7,
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/img/attendance.png',
                                      width: 50,
                                    ),
                                    Text(
                                      'Attendence',
                                      style: FColor.font,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              width: MediaQuery.sizeOf(context).width / 3.6,
                              // height: MediaQuery.sizeOf(context).height / 7,
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/img/score.png',
                                    width: 50,
                                  ),
                                  Text(
                                    'Marks',
                                    style: FColor.font,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            // elevation: 5,
                            child: Container(
                              width: MediaQuery.sizeOf(context).width / 3.6,
                              // height: MediaQuery.sizeOf(context).height / 7,
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/img/notice.png',
                                    width: 50,
                                  ),
                                  Text(
                                    'Notice',
                                    style: FColor.font,
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Card(
                              child: Container(
                                width: MediaQuery.sizeOf(context).width / 3.6,
                                // height: MediaQuery.sizeOf(context).height / 7,
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/img/cashless-payment.png',
                                      width: 50,
                                    ),
                                    Text(
                                      'Payment',
                                      style: FColor.font,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
