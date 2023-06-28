import 'package:flutter/material.dart';
import '../../../models/course_models.dart';
import '../../../size_config.dart';
import '../../../widgets/courses_card.dart';

class NewCourses extends StatelessWidget {
  final List<CourseModel> newCoursesList ;
  final VoidCallback?  function;

  const NewCourses({Key? key, required this.newCoursesList,  this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            newCoursesList.length,
                (index) {
              return CoursesCard(course: newCoursesList[index],size:
              0.55 ,isLive: false, function: function);
            },
          ),
          SizedBox(width: screenWidthDivided(20,context)),

        ],
      ),
    );
  }
}
