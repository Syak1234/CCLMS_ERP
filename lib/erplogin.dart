import 'dart:async';
import 'dart:convert';
import 'package:cclms/backgroundcolor/bgcolor.dart';
import 'package:cclms/dashboard.dart';
import 'package:cclms/getx.dart';
import 'package:cclms/urllink.dart';
import 'package:cclms/class/userDetails.dart';
import 'package:circles_background/circles_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class ErpLogin extends StatefulWidget {
  const ErpLogin({super.key});

  @override
  State<ErpLogin> createState() => _ErpLoginState();
}

class _ErpLoginState extends State<ErpLogin> with TickerProviderStateMixin {
  Getx obj = Getx();
  List<UserDetails> userdetails = [];
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  GlobalKey<FormState> gk = GlobalKey();
  InputDecoration form1 = const InputDecoration(
    prefixIcon: Icon(Icons.person),
    hintText: 'College-id/Mobile/AADHAAR',
    fillColor: Colors.white,
    helperStyle: TextStyle(color: Colors.black),
    prefixIconColor: Colors.black,
    filled: true,
    errorStyle: TextStyle(
      color: Colors.red,
    ),
    hintStyle: TextStyle(fontSize: 13, color: Colors.black54),
  );
  late SharedPreferences sp;
  @override
  void initState() {
    super.initState();
  }

  Future erplogin(String username, String password) async {
    // try {
    sp = await SharedPreferences.getInstance();
    Map data = {'username': username, 'password': password};
    final res =
        await http.post(Uri.parse('${UrlLink.baseurl}login'), body: data);

    var jsondata = jsonDecode(res.body);
    if (jsondata['status'] == true) {
      UserDetails details = UserDetails(
          id: jsondata['info']['id'].toString(),
          status: jsondata['info']['status'].toString(),
          aadhar_no: jsondata['info']['aadhar_no'].toString(),
          academic_year: jsondata['info']['academic_year'].toString(),
          address: jsondata['info']['address'].toString(),
          admission_date: jsondata['info']['admission_date'].toString(),
          admission_status: jsondata['info']['admission_status'].toString(),
          batch: jsondata['info']['batch'].toString(),
          caste: jsondata['info']['caste'].toString(),
          college_id: jsondata['info']['college_id'].toString(),
          course: jsondata['info']['course'].toString(),
          created_at: jsondata['info']['created_at'].toString(),
          dob: jsondata['info']['dob'].toString(),
          edu_qualification: jsondata['info']['edu_qualification'].toString(),
          email_id: jsondata['info']['email_id'].toString(),
          fathers_name: jsondata['info']['fathers_name'].toString(),
          gender: jsondata['info']['gender'].toString(),
          guirdian_mobile: jsondata['info']['guirdian_mobile'].toString(),
          image: jsondata['info']['image'].toString(),
          mothers_name: jsondata['info']['mothers_name'].toString(),
          nationality: jsondata['info']['nationality'].toString(),
          password: jsondata['info']['password'].toString(),
          religion: jsondata['info']['religion'].toString(),
          std_mobile: jsondata['info']['std_mobile'].toString(),
          student_lead_id: jsondata['info']['student_lead_id'].toString(),
          student_name: jsondata['info']['student_name'].toString(),
          total_fees: jsondata['info']['total_fees'].toString(),
          updated_at: jsondata['info']['updated_at'].toString(),
          token: jsondata['token']);

      userdetails.add(details);
      obj.visibile(true, true);
      obj.isvalid(true);
      sp.setString('login', '1');

      sp.setString('id', details.id);
      sp.setString('status', details.status);
      sp.setString('aadhar_no', details.aadhar_no);
      sp.setString('academic_year', details.academic_year);
      sp.setString('address', details.address);
      sp.setString('admission_date', details.admission_date);
      sp.setString('admission_status', details.admission_status);
      sp.setString('batch', details.batch);
      sp.setString('caste', details.caste);
      sp.setString('college_id', details.college_id);
      sp.setString('course', details.course);
      sp.setString('created_at', details.created_at);
      sp.setString('dob', details.dob);
      sp.setString('edu_qualification', details.edu_qualification);
      sp.setString('email_id', details.email_id);
      sp.setString('fathers_name', details.fathers_name);
      sp.setString('gender', details.gender);
      sp.setString('guirdian_mobile', details.guirdian_mobile);
      sp.setString('image', details.image);
      sp.setString('mothers_name', details.mothers_name);
      sp.setString('nationality', details.nationality);
      sp.setString('password', details.password);
      sp.setString('religion', details.religion);
      sp.setString('std_mobile', details.std_mobile);
      sp.setString('student_lead_id', details.student_lead_id);
      sp.setString('student_name', details.student_name);
      sp.setString('total_fees', details.total_fees);
      sp.setString('updated_at', details.updated_at);
      sp.setString('token', details.token);

      Future.delayed(const Duration(seconds: 1), () {
        Get.off(() => DashBoard(details), transition: Transition.leftToRight);
      });
    } else {
      obj.visibile(true, false);
      obj.isvalid(true);
    }
    // } catch (e) {
    //   SnackBar(content: Text(e.toString()));
    // }
  }

  Future check(String userid, String pass) async {
    if (gk.currentState!.validate()) {
      obj.isvalid(false);
      erplogin(userid, pass);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: CirclesBackground(
          circles: BackgroundColor.circles1,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Obx(
                    () => Visibility(
                      visible: obj.visible.value,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50, left: 20),
                            child: obj.login.value
                                ? Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.green,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Login successfull',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              obj.visibile(false, false);
                                            },
                                            icon: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ))
                                      ],
                                    ))
                                : Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.red,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Login failed',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              obj.visibile(false, false);
                                            },
                                            icon: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ))
                                      ],
                                    )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'CCLMS ERP'.toUpperCase(),
                          textScaler: const TextScaler.linear(2),
                          style: GoogleFonts.salsa(
                              textStyle:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/img/logocclms.png',
                            width: 120,
                            height: 120,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          borderOnForeground: true,
                          elevation: 10,
                          color: Colors.white60,
                          child: SizedBox(
                            width: 310,
                            height: 340,
                            child: Form(
                              key: gk,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('LOGIN',
                                          textScaler:
                                              const TextScaler.linear(2),
                                          style: GoogleFonts.salsa(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.3,
                                          child: TextFormField(
                                            textInputAction:
                                                TextInputAction.next,
                                            controller: t1,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: (value) {
                                              if (t1.text.isEmpty) {
                                                return 'Cannot blank';
                                              } else {
                                                return null;
                                              }
                                            },
                                            keyboardType: TextInputType.text,
                                            decoration: form1,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.3,
                                          child: Obx(
                                            () => TextFormField(
                                              style: const TextStyle(
                                                  color: Colors.black),
                                              controller: t2,
                                              obscureText: obj.visibility.value,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              validator: (value) {
                                                if (t2.text.isEmpty) {
                                                  return 'Cannot blank';
                                                }
                                                return null;
                                              },
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                  prefixIconColor: Colors.black,
                                                  suffixIconColor: Colors.red,
                                                  errorStyle: const TextStyle(
                                                    color: Colors.red,
                                                  ),
                                                  hintText: 'Password',
                                                  prefixIcon: const Icon(
                                                      Icons.password_sharp),
                                                  fillColor: Colors.white,
                                                  suffixIcon: obj
                                                          .visibility.value
                                                      ? IconButton(
                                                          onPressed: () {
                                                            obj.visibilitycheck();
                                                          },
                                                          icon: const Icon(
                                                              Icons.visibility))
                                                      : IconButton(
                                                          onPressed: () {
                                                            obj.visibilitycheck();
                                                          },
                                                          icon: const Icon(Icons
                                                              .visibility_off)),
                                                  filled: true,
                                                  hintStyle: const TextStyle(
                                                      color: Colors.black54
                                                      // fontWeight: FontWeight.bold,
                                                      )),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.3,
                                            child: Obx(
                                              () => ElevatedButton(
                                                style: ButtonStyle(
                                                    shape: MaterialStatePropertyAll(
                                                        BeveledRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10))),
                                                    backgroundColor:
                                                        const MaterialStatePropertyAll(
                                                            Colors.blue)),
                                                onPressed: () async {
                                                  await check(t1.text, t2.text);
                                                },
                                                child: obj.show.value
                                                    ? const Text(
                                                        'Submit',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )
                                                    : const Center(
                                                        child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Please wait   ',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          CircularProgressIndicator(
                                                            strokeWidth: 2,
                                                            color: Colors.white,
                                                          ),
                                                        ],
                                                      )),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
