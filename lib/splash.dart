import 'package:cclms/backgroundcolor/bgcolor.dart';
import 'package:cclms/dashboard.dart';
import 'package:cclms/erplogin.dart';
import 'package:cclms/class/userDetails.dart';
import 'package:circles_background/circles_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences sp;

  @override
  void initState() {
    super.initState();
    checkScreen();
  }

  // UserDetails userDetails = UserDetails(
  //     id: "id",
  //     status: "status",
  //     college_id: "college_id",
  //     student_name: "student_name",
  //     fathers_name: "fathers_name",
  //     mothers_name: "mothers_name",
  //     std_mobile: "std_mobile",
  //     guirdian_mobile: "guirdian_mobile",
  //     dob: "dob",
  //     aadhar_no: "aadhar_no",
  //     email_id: "email_id",
  //     gender: "gender",
  //     caste: "caste",
  //     edu_qualification: "edu_qualification",
  //     nationality: "nationality",
  //     religion: "religion",
  //     admission_date: "admission_date",
  //     admission_status: "admission_status",
  //     course: "course",
  //     academic_year: "academic_year",
  //     batch: "batch",
  //     address: "address",
  //     image: "image",
  //     password: "password",
  //     student_lead_id: "student_lead_id",
  //     total_fees: "total_fees",
  //     created_at: "created_at",
  //     updated_at: "updated_at");
  void checkScreen() async {
    sp = await SharedPreferences.getInstance();
    var a = sp.getString('login') ?? '';
    if (a.isEmpty) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ErpLogin()));
      });
    } else if (a.isNotEmpty) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => DashBoard(UserDetails(
                id: sp.getString('id') ?? '',
                status: sp.getString('status') ?? '',
                college_id: sp.getString('college_id') ?? '',
                student_name: sp.getString("student_name") ?? '',
                fathers_name: sp.getString("fathers_name") ?? '',
                mothers_name: sp.getString("mothers_name") ?? '',
                std_mobile: sp.getString("std_mobile") ?? '',
                guirdian_mobile: sp.getString("guirdian_mobile") ?? '',
                dob: sp.getString("dob") ?? '',
                aadhar_no: sp.getString("aadhar_no") ?? '',
                email_id: sp.getString("email_id") ?? '',
                gender: sp.getString("gender") ?? '',
                caste: sp.getString("caste") ?? '',
                edu_qualification: sp.getString("edu_qualification") ?? '',
                nationality: sp.getString("nationality") ?? '',
                religion: sp.getString("religion") ?? '',
                admission_date: sp.getString("admission_date") ?? '',
                admission_status: sp.getString("admission_status") ?? '',
                course: sp.getString("course") ?? '',
                academic_year: sp.getString('academic_year') ?? '',
                batch: sp.getString("batch") ?? '',
                address: sp.getString("address") ?? '',
                image: sp.getString("image") ?? '',
                password: sp.getString("password") ?? '',
                student_lead_id: sp.getString("student_lead_id") ?? '',
                total_fees: sp.getString("total_fees") ?? '',
                created_at: sp.getString("created_at") ?? '',
                updated_at: sp.getString("updated_at") ?? '',
                token: sp.getString('token') ?? ''))));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: CirclesBackground(
          circles: BackgroundColor.circles,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'CCLMS ERP',
                        textScaler: const TextScaler.linear(3),
                        style: GoogleFonts.salsa(
                            textStyle: const TextStyle(color: Colors.white)),
                      )
                          .animate()
                          .slideX(duration: const Duration(milliseconds: 500))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 150,
                      backgroundImage: AssetImage(
                        "assets/img/logo.jpg",
                      ),
                    )
                        .animate()
                        // .rotate(duration: const Duration(seconds: 1))
                        .scale(duration: const Duration(seconds: 3)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          textAlign: TextAlign.center,
                          'Contai College of Learning\n&\nManagement Science',
                          textScaler: const TextScaler.linear(1),
                          style: GoogleFonts.salsa(
                              textStyle: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white)),
                        ).animate().slideX(
                            duration: const Duration(milliseconds: 500)),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 210),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          textAlign: TextAlign.center,
                          'Develop by Sayak Mishra',
                          textScaler: TextScaler.linear(1),
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
