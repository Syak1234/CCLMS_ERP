import 'package:cclms/textcolor/fontcolor.dart';
import 'package:cclms/class/userDetails.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserProfile extends StatefulWidget {
  late UserDetails details;
  UserProfile(this.details, {super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  GlobalKey<FormState> gk = GlobalKey();
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  TextEditingController t4 = TextEditingController();
  TextEditingController t5 = TextEditingController();
  TextEditingController t6 = TextEditingController();
  TextEditingController t7 = TextEditingController();
  TextEditingController t8 = TextEditingController();
  TextEditingController t9 = TextEditingController();
  TextEditingController t10 = TextEditingController();
  TextEditingController t11 = TextEditingController();
  TextEditingController t12 = TextEditingController();
  TextEditingController t13 = TextEditingController();
  TextEditingController t14 = TextEditingController();
  TextEditingController t15 = TextEditingController();
  TextEditingController t16 = TextEditingController();
  bool field = false;

  @override
  void initState() {
    super.initState();
    t1.text = widget.details.student_name;
    t2.text = widget.details.email_id;
    t3.text = widget.details.course;
    t4.text = widget.details.fathers_name;
    t5.text = widget.details.mothers_name;
    t6.text = widget.details.nationality;
    t7.text = widget.details.religion;
    t8.text = widget.details.std_mobile;
    t9.text = widget.details.guirdian_mobile;
    t10.text = widget.details.dob;
    t11.text = widget.details.aadhar_no;
    t12.text = widget.details.edu_qualification;
    t13.text = widget.details.academic_year;
    t14.text = widget.details.batch;
    t15.text = widget.details.college_id;
    t16.text = widget.details.id;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text(
            'Profile',
            style: FColor.font1,
            textScaler: const TextScaler.linear(1.5),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showMenu(
                      initialValue: 1,
                      context: context,
                      position: const RelativeRect.fromLTRB(100, 0, 0, 0),
                      items: [
                        const CheckedPopupMenuItem(
                            // value: 1,
                            checked: true,
                            enabled: true,
                            child: Text('Edit')),
                      ]);
                },
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ))
          ],
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(150),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D'),
                  ),
                  Text(
                    t1.text,
                    style: FColor.font1,
                  ),
                  Text(
                    t3.text,
                    style: FColor.font,
                  ),
                ],
              )),
        ),
        body: SingleChildScrollView(
          child: Form(
              child: Column(
            children: [
              ListTile(
                title: Text('College id', style: FColor.font2),
                trailing: Text(widget.details.id, style: FColor.font),
              ),
              ListTile(
                title: Text(
                  'Email-id',
                  style: FColor.font2,
                ),
                trailing: Text(widget.details.email_id, style: FColor.font),
              ),
              ListTile(
                title: Text(
                  'Father name',
                  style: FColor.font2,
                ),
                trailing: Text(widget.details.fathers_name, style: FColor.font),
              ),
              ListTile(
                title: Text('Mother name', style: FColor.font2),
                trailing: Text(widget.details.mothers_name, style: FColor.font),
              ),
              ListTile(
                title: Text('Nationality', style: FColor.font2),
                trailing: Text(widget.details.nationality, style: FColor.font),
              ),
              ListTile(
                title: Text('Religion', style: FColor.font2),
                trailing: Text(widget.details.religion, style: FColor.font),
              ),
              ListTile(
                title: Text('Student mobile', style: FColor.font2),
                trailing: Text(widget.details.std_mobile, style: FColor.font),
              ),
              ListTile(
                title: Text('Guardian mobile', style: FColor.font2),
                trailing:
                    Text(widget.details.guirdian_mobile, style: FColor.font),
              ),
              ListTile(
                title: Text('DOB', style: FColor.font2),
                trailing: Text(widget.details.dob, style: FColor.font),
              ),
              ListTile(
                title: Text('AADHAAR NO', style: FColor.font2),
                trailing: Text(widget.details.aadhar_no, style: FColor.font),
              ),
              ListTile(
                title: Text('Educational qualification', style: FColor.font2),
                trailing:
                    Text(widget.details.edu_qualification, style: FColor.font),
              ),
              ListTile(
                title: Text('Academic year', style: FColor.font2),
                trailing:
                    Text(widget.details.academic_year, style: FColor.font),
              ),
              ListTile(
                title: Text('College id', style: FColor.font2),
                trailing: Text(widget.details.college_id, style: FColor.font),
              ),

              // TextFormField(
              //   controller: t2,
              //   decoration: const InputDecoration(
              //     border: UnderlineInputBorder(borderSide: BorderSide.none),
              //     prefixIcon: Icon(Icons.email_rounded),
              //   ),
              // ),
              // TextFormField(
              //   controller: t4,
              //   decoration: const InputDecoration(
              //     border: UnderlineInputBorder(borderSide: BorderSide.none),
              //     prefixIcon: Icon(Icons.person),
              //   ),
              // ),
              // TextFormField(
              //   controller: t5,
              //   decoration: const InputDecoration(
              //     border: UnderlineInputBorder(borderSide: BorderSide.none),
              //     prefixIcon: Icon(Icons.person),
              //   ),
              // ),
              // TextFormField(
              //   controller: t6,
              //   decoration: const InputDecoration(
              //     border: UnderlineInputBorder(borderSide: BorderSide.none),
              //     prefixIcon: Icon(Icons.person_2),
              //   ),
              // ),
              // TextFormField(
              //   controller: t7,
              //   decoration: const InputDecoration(
              //     border: UnderlineInputBorder(borderSide: BorderSide.none),
              //     prefixIcon: Icon(Icons.details),
              //   ),
              // ),
              // TextFormField(
              //   controller: t8,
              //   decoration: const InputDecoration(
              //     border: UnderlineInputBorder(borderSide: BorderSide.none),
              //     prefixIcon: Icon(Icons.phone_android),
              //   ),
              // ),
              // TextFormField(
              //   controller: t9,
              //   decoration: const InputDecoration(
              //     border: UnderlineInputBorder(borderSide: BorderSide.none),
              //     prefixIcon: Icon(Icons.phone),
              //   ),
              // ),
              // TextFormField(
              //   controller: t10,
              //   decoration: const InputDecoration(
              //     border: UnderlineInputBorder(borderSide: BorderSide.none),
              //     prefixIcon: Icon(Icons.cake_rounded),
              //   ),
              // ),
              // TextFormField(
              //   controller: t11,
              //   decoration: InputDecoration(
              //     prefixIcon: Icon(Icons.card_giftcard),
              //     border: UnderlineInputBorder(borderSide: BorderSide.none),
              //   ),
              // ),
              // TextFormField(
              //   controller: t12,
              //   decoration: const InputDecoration(
              //     border: UnderlineInputBorder(borderSide: BorderSide.none),
              //     prefixIcon: Icon(Icons.info),
              //   ),
              // ),
              // TextFormField(
              //   controller: t13,
              //   decoration: const InputDecoration(
              //     border: UnderlineInputBorder(borderSide: BorderSide.none),
              //     prefixIcon: Icon(Icons.accessibility_rounded),
              //   ),
              // ),
              // TextFormField(
              //   controller: t14,
              //   decoration: const InputDecoration(
              //     border: UnderlineInputBorder(borderSide: BorderSide.none),
              //     prefixIcon: Icon(Icons.batch_prediction),
              //   ),
              // ),
            ],
          )),
        ),
      ),
    );
  }
}
