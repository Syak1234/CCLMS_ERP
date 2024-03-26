import 'dart:convert';
import 'dart:io';

import 'package:cclms/getx.dart';
import 'package:cclms/textcolor/fontcolor.dart';
import 'package:cclms/urllink.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CvHome extends StatefulWidget {
  const CvHome({super.key});

  @override
  State<CvHome> createState() => _CvHomeState();
}

class _CvHomeState extends State<CvHome> {
  Getx obj = Get.put(Getx());
  String cvprofileimg = "assets/img/curriculum-vitae.png";
  Widget lineShow() {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 1.4,
      child: Column(children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 10,
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: FColor.grey,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.6,
              height: 10,
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: FColor.grey,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.9,
              height: 10,
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: FColor.grey,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 7,
              height: 10,
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: FColor.grey,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 7,
              height: 10,
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: FColor.grey,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.9,
              height: 10,
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: FColor.grey,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3,
              height: 10,
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: FColor.grey,
              ),
            ),
          ],
        )
      ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
    obj.showfile.value = PlatformFile(name: '', size: 0);
    obj.s.value = false;
  }

  late SharedPreferences sp;
  Future cvUpload(File filePath) async {
    sp = await SharedPreferences.getInstance();
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    // try {
    final token = sp.getString('token');
    print(token);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      // 'Custom-Header': '1',
    };

    // Prepare the request
    var request = http.MultipartRequest(
        'POST', Uri.parse('${UrlLink.baseurl}student/CV/add'));

    // Attach file
    request.files.add(http.MultipartFile.fromBytes(
      'file',
      filePath.readAsBytesSync(),
      filename: filePath.path.split("/").last,
    ));
    var id = sp.getString('id') ?? Null;
    request.fields['student_id'] = '$id';

    request.headers.addAll(
      headers,
    );

    // Send the request
    var response = await http.Response.fromStream(await request.send());
    Navigator.pop(context);
    // Handle the response
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');
    // } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Resume/CV',
            style: GoogleFonts.salsa(color: Colors.white, fontSize: 16),
            textScaler: const TextScaler.linear(2),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Text(
                      'Please upload your CV/resume.We will use to find the right opportunities for you.',
                      style: GoogleFonts.salsa(
                        color: const Color.fromARGB(255, 141, 135, 135),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DottedBorder(
                      strokeWidth: 3,
                      color: FColor.grey,
                      dashPattern: const [20, 10],
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Obx(
                            () => Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        obj.s.value
                                            ? cvprofileimg
                                            : cvprofileimg,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3.6,
                                      )
                                    ],
                                  ),
                                ),
                                obj.s.value
                                    ? const Text(
                                        '',
                                        style: TextStyle(color: Colors.red),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: lineShow(),
                                      ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.2,
                                          child: obj.s.value
                                              ? Text(obj.showfile.value.name
                                                  .toString())
                                              : const Text(
                                                  'Only .docx .doc .pdf files are allowed',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ))
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.4,
                                      margin: const EdgeInsets.only(
                                          top: 15, bottom: 15),
                                      child: MaterialButton(
                                          padding: const EdgeInsets.all(10),
                                          shape: BeveledRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          color: obj.s.value
                                              ? Colors.red
                                              : Colors.green,
                                          onPressed: () {
                                            obj.showfile.value =
                                                PlatformFile(name: '', size: 0);
                                            obj.s.value
                                                ? obj.s.value = false
                                                : obj.pickCvFile();
                                          },
                                          child: obj.s.value
                                              ? Text(
                                                  'Remove Resume/CV',
                                                  style: GoogleFonts.salsa(
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                )
                                              : Text(
                                                  'Upload Resume/CV',
                                                  style: GoogleFonts.salsa(
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                )),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => obj.s.value
                    ? Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.blue)),
                                onPressed: () {
                                  obj.openFile(obj.showfile.value);
                                },
                                child: Text(
                                  'View CV',
                                  style: GoogleFonts.salsa(color: Colors.white),
                                ))
                          ],
                        ),
                      )
                    : SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: MaterialButton(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(10),
                        color: Colors.blue,
                        onPressed: () {
                          try {
                            if (obj.showfile.value.path!.isNotEmpty) {
                              cvUpload(
                                  File(obj.showfile.value.path.toString()));
                            }
                          } catch (e) {}
                        },
                        child: Text(
                          'Save',
                          style: GoogleFonts.salsa(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
