import 'package:cclms/class/userDetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Profile extends StatefulWidget {
  UserDetails details;
  Profile(this.details, {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<Profile> createState() => _ProfileState(details);
}

class _ProfileState extends State<Profile> {
  UserDetails details;
  bool field = false;
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
  InputDecoration f1 = const InputDecoration(
      fillColor: Colors.white,
      filled: true,
      hintText: 'Email',
      labelText: 'Email');

  _ProfileState(this.details);

  @override
  void initState() {
    super.initState();
    t1.text = details.student_name;
    t2.text = details.email_id;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Profile',
              style: GoogleFonts.sacramento(),
              textScaler: const TextScaler.linear(1.5),
            ),
            // backgroundColor: Color.fromARGB(255, 57, 161, 247),
            actions: const [
              CircleAvatar(
                radius: 40,
                // child: Text('data'),
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Form(
              key: gk,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        // height: 50,
                        width: 320,
                        // padding: EdgeInsets.symmetric(vertical: 20),
                        child: Card(
                          elevation: 5,

                          // shadowColor: Colors.grey,
                          child: TextFormField(
                            style: const TextStyle(color: Colors.black),
                            controller: t1,
                            enabled: field,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                contentPadding:
                                    const EdgeInsets.only(bottom: 10, left: 18),
                                fillColor: Colors.white,
                                filled: true,
                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                                hintText: 'Name',
                                labelStyle: const TextStyle(color: Colors.blue),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit)),
                                labelText: 'Name'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        // height: 50,
                        width: 320,
                        // padding: EdgeInsets.symmetric(vertical: 20),
                        child: Card(
                          elevation: 5,
                          child: TextFormField(
                            enabled: field,
                            style: const TextStyle(color: Colors.black),
                            controller: t2,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                contentPadding:
                                    const EdgeInsets.only(bottom: 10, left: 18),
                                fillColor: Colors.white,
                                filled: true,
                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                                hintText: 'Email',
                                labelStyle: const TextStyle(color: Colors.blue),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit)),
                                labelText: 'Email'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        // height: 50,
                        width: 320,
                        // padding: EdgeInsets.symmetric(vertical: 20),
                        child: Card(
                          elevation: 5,
                          child: TextFormField(
                            enabled: field,
                            style: const TextStyle(color: Colors.black),
                            controller: t3,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                contentPadding:
                                    const EdgeInsets.only(bottom: 10, left: 18),
                                fillColor: Colors.white,
                                filled: true,
                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                                hintText: 'id',
                                labelStyle: const TextStyle(color: Colors.blue),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit)),
                                labelText: 'id'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        // height: 50,
                        width: 320,
                        // padding: EdgeInsets.symmetric(vertical: 20),
                        child: Card(
                          elevation: 5,
                          child: TextFormField(
                            enabled: field,
                            style: const TextStyle(color: Colors.black),
                            controller: t4,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                contentPadding:
                                    const EdgeInsets.only(bottom: 10, left: 18),
                                fillColor: Colors.white,
                                filled: true,
                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                                hintText: 'status',
                                labelStyle: const TextStyle(color: Colors.blue),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit)),
                                labelText: 'status'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        // height: 50,
                        width: 320,
                        // padding: EdgeInsets.symmetric(vertical: 20),
                        child: Card(
                          elevation: 5,
                          child: TextFormField(
                            enabled: field,
                            style: const TextStyle(color: Colors.black),
                            controller: t5,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                contentPadding:
                                    const EdgeInsets.only(bottom: 10, left: 18),
                                fillColor: Colors.white,
                                filled: true,
                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                                hintText: 'college-id',
                                labelStyle: const TextStyle(color: Colors.blue),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit)),
                                labelText: 'college-id'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        // height: 50,
                        width: 320,
                        // padding: EdgeInsets.symmetric(vertical: 20),
                        child: Card(
                          elevation: 5,
                          child: TextFormField(
                            enabled: field,
                            style: const TextStyle(color: Colors.black),
                            controller: t6,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                contentPadding:
                                    const EdgeInsets.only(bottom: 10, left: 18),
                                fillColor: Colors.white,
                                filled: true,
                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                                hintText: 'father name',
                                labelStyle: const TextStyle(color: Colors.blue),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit)),
                                labelText: 'father name'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        // height: 50,
                        width: 320,
                        // padding: EdgeInsets.symmetric(vertical: 20),
                        child: Card(
                          elevation: 5,
                          child: TextFormField(
                            enabled: field,
                            style: const TextStyle(color: Colors.black),
                            controller: t7,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                contentPadding:
                                    const EdgeInsets.only(bottom: 10, left: 18),
                                fillColor: Colors.white,
                                filled: true,
                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                                hintText: ' mother name',
                                labelStyle: const TextStyle(color: Colors.blue),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit)),
                                labelText: 'mother name'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        // height: 50,
                        width: 320,
                        // padding: EdgeInsets.symmetric(vertical: 20),
                        child: Card(
                          elevation: 5,
                          child: TextFormField(
                            enabled: field,
                            style: const TextStyle(color: Colors.black),
                            controller: t12,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                contentPadding:
                                    const EdgeInsets.only(bottom: 10, left: 18),
                                fillColor: Colors.white,
                                filled: true,
                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                                hintText: 'Student id',
                                labelStyle: const TextStyle(color: Colors.blue),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit)),
                                labelText: 'Student id'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        // height: 50,
                        width: 320,
                        // padding: EdgeInsets.symmetric(vertical: 20),
                        child: Card(
                          elevation: 5,
                          child: TextFormField(
                            enabled: field,
                            style: const TextStyle(color: Colors.black),
                            controller: t8,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                contentPadding:
                                    const EdgeInsets.only(bottom: 10, left: 18),
                                fillColor: Colors.white,
                                filled: true,
                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                                hintText: 'mobile',
                                labelStyle: const TextStyle(color: Colors.blue),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit)),
                                labelText: 'student-mobile'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        // height: 50,
                        width: 320,
                        // padding: EdgeInsets.symmetric(vertical: 20),
                        child: Card(
                          elevation: 5,
                          child: TextFormField(
                            enabled: field,
                            style: const TextStyle(color: Colors.black),
                            controller: t9,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                contentPadding:
                                    const EdgeInsets.only(bottom: 10, left: 18),
                                fillColor: Colors.white,
                                filled: true,
                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                                hintText: 'mobile',
                                labelStyle: const TextStyle(color: Colors.blue),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit)),
                                labelText: 'guardian-mobile'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        // height: 50,
                        width: 320,
                        // padding: EdgeInsets.symmetric(vertical: 20),
                        child: Card(
                          elevation: 5,
                          child: TextFormField(
                            enabled: field,
                            style: const TextStyle(color: Colors.black),
                            controller: t10,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                contentPadding:
                                    const EdgeInsets.only(bottom: 10, left: 18),
                                fillColor: Colors.white,
                                filled: true,
                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                                hintText: 'DOB',
                                labelStyle: const TextStyle(color: Colors.blue),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit)),
                                labelText: 'DOB'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        // height: 50,
                        width: 320,
                        // padding: EdgeInsets.symmetric(vertical: 20),
                        child: Card(
                          elevation: 5,
                          child: TextFormField(
                            enabled: field,
                            style: const TextStyle(color: Colors.black),
                            controller: t11,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                contentPadding:
                                    const EdgeInsets.only(bottom: 10, left: 18),
                                fillColor: Colors.white,
                                filled: true,
                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                                hintText: 'AADHAR-NO',
                                labelStyle: const TextStyle(color: Colors.blue),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit)),
                                labelText: 'AADHAR-NO'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
