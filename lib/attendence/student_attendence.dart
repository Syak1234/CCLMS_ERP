import 'package:cclms/textcolor/fontcolor.dart';
import 'package:cclms/urllink.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class StudentAttendence extends StatefulWidget {
  const StudentAttendence({super.key});

  @override
  State<StudentAttendence> createState() => _StudentAttendenceState();
}

class _StudentAttendenceState extends State<StudentAttendence> {
  CalendarController datepick = CalendarController();

  bool _isDateHighlighted(DateTime date) {
    // Add your logic to determine which dates to highlight
    // For example, highlighting weekends
    print(date);
    return date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  late SharedPreferences sp;
  Future fetchattendance(int month, int year) async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return CircularProgressIndicator();
          });
      sp = await SharedPreferences.getInstance();
      var student_id = sp.getString('id') ?? 0;

      Map body = {
        'student_id': student_id,
        'attendance_month': month,
        'attendance_year': year
      };
      var res = await post(Uri.parse(UrlLink.baseurl + 'student/attendance'),
          body: body);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text('Attendance'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: SfCalendar(
                view: CalendarView.month,
                monthViewSettings: const MonthViewSettings(
                    // appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                    showAgenda: true),

                monthCellBuilder:
                    (BuildContext context, MonthCellDetails details) {
                  // Check if the date needs to be highlighted
                  // if () {

                  bool isHighlighted = _isDateHighlighted(details.date);
                  // Return a container with custom decoration if the date is highlighted
                  if (details.date !=
                          DateTime(DateTime.now().year, DateTime.now().month,
                              DateTime.now().day) &&
                      isHighlighted) {
                    return Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.green),
                      // color: Colors.red, // Set your highlight color here
                      child: Center(
                        child: Text(
                          details.date.day.toString(),
                          style: const TextStyle(
                            color: Colors
                                .white, // Set text color for highlighted date
                          ),
                        ),
                      ),
                    );
                    // }
                    // return;
                    // } else {
                    //   return Container(
                    //     color: Colors.transparent, // Set your highlight color here
                    //     child: Center(
                    //       child: Text(
                    //         details.date.day.toString(),
                    //         style: TextStyle(
                    //           color:
                    //               Colors.white, // Set text color for highlighted date
                    //         ),
                    //       ),
                    //     ),
                    //   );
                    //   // Return null for dates that don't need highlighting
                    // }
                  } else {
                    return Container(
                      color:
                          Colors.transparent, // Set your highlight color here
                      child: Center(
                        child: Text(
                          details.date.day.toString(),
                          style: const TextStyle(
                            color: Colors
                                .white, // Set text color for highlighted date
                          ),
                        ),
                      ),
                    );
                  }
                },
                controller: datepick,
                // dataSource: CalendarDataSource[],
                // initialDisplayDate: DateTime(05, 06, 2022),
                showCurrentTimeIndicator: true,
                onTap: (calendarTapDetails) {
                  // print(datepick.);
                },
                allowedViews: const [
                  CalendarView.month,
                  CalendarView.day,
                  CalendarView.week,
                  CalendarView.workWeek,
                  CalendarView.timelineDay,
                  CalendarView.timelineWeek,
                  CalendarView.timelineWorkWeek,
                  CalendarView.timelineMonth,
                  CalendarView.schedule
                ],
                selectionDecoration:
                    BoxDecoration(color: Colors.blue.withOpacity(0.3)),
                // monthCellBuilder: (context, details) {
                //   return CalendarView.month;
                // },

                // monthViewSettings: const MonthViewSettings(showAgenda: true),
                // allowDragAndDrop: true,
                headerDateFormat: 'y',
                // showCurrentTimeIndicator: true,
                todayHighlightColor: Colors.orange,
                // showWeekNumber: true,
                // allowedViews: [
                //   CalendarView.day,
                //   CalendarView.month,
                // ],
                timeSlotViewSettings: TimeSlotViewSettings(
                    startHour: 0,
                    endHour: 24,
                    nonWorkingDays: <int>[DateTime.friday, DateTime.saturday]),
                // backgroundColor: Colors.blue,
                // cellBorderColor: Colors.white,
                showTodayButton: true,

                todayTextStyle: TextStyle(color: Colors.white),
                // appointmentTextStyle: TextStyle(color: Colors.white),
                showNavigationArrow: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                      height: 150,
                      width: 150,
                      // color: Colors.red,
                      child: Center(
                        child: CircularPercentIndicator(
                          radius: 60,
                          animation: true,
                          animationDuration: 800,
                          lineWidth: 12.0,
                          percent: 0.5,
                          center: new Text(
                            "40%",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          footer: new Text(
                            "Month percentages",
                            style: FColor.font1,
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          // circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Colors.red,
                          progressColor: Colors.blue,
                          // curve: Curves.bounceIn,
                        ),
                      )),
                ),
                Expanded(
                    child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.blue,
                )),
              ],
            )
          ],
        ));
  }
}
