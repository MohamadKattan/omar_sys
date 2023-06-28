import 'package:flutter/material.dart';

import '../../../models/course_models.dart';
import '../../../size_config.dart';
import '../../../widgets/courses_card.dart';

class LiveCourses extends StatelessWidget {
  final   List<CourseModel> liveCoursesList;
  final VoidCallback?  function;

  const LiveCourses({Key? key, required this.liveCoursesList,  this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            liveCoursesList.length,
                (index) {
              return CoursesCard(course: liveCoursesList[index],size:
              0.50 ,isLive: true, function: function,);
            },
          ),
          SizedBox(width: screenWidthDivided(20,context)),

        ],
      ),
    );
  }
}