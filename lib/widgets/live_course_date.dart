import 'package:flutter/material.dart';
import '../models/course_models.dart';
import '../size_config.dart';


class LiveCourseDate extends StatelessWidget {
  final CourseModel course;

  const LiveCourseDate({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          // functions.getDateDayString(course.liveClassSchedule),
    course.liveClassSchedule,
          style: TextStyle(
              fontSize: screenWidthDivided(30, context),
              fontWeight: FontWeight.w600,
              color: Colors.deepOrange),
        ),

    //     Text(
    //       ' / ',
    //       style: TextStyle(
    //         fontSize: screenWidthDivided(30, context),
    //         fontWeight: FontWeight.w600,
    //       ),
    //     ),
    //     Text(
    //       // functions
    //       //     .getDateMonthString(course.liveClassSchedule),
    // course.liveClassSchedule,
    //       style: TextStyle(
    //         fontSize: screenWidthDivided(30, context),
    //         fontWeight: FontWeight.w600,
    //       ),
    //     ),
        // Text(
        //   ' / ',
        //   style: TextStyle(
        //     fontSize: screenWidthDivided(30, context),
        //     fontWeight: FontWeight.w600,
        //   ),
        // ),
        // Text(
        //   functions.getDateYearString(course.liveClassSchedule),
        //   style: TextStyle(
        //     fontSize: screenWidthDivided(30, context),
        //     fontWeight: FontWeight.w600,
        //   ),
        // ),

      ],
    );
  }
}
