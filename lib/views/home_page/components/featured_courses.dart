import 'package:flutter/material.dart';
import 'package:omar_system/size_config.dart';
import '../../../models/course_models.dart';
import '../../../widgets/courses_card.dart';

class FeaturedCourses extends StatelessWidget {
  final VoidCallback?  function;

  final List<CourseModel> featuredCoursesList;
  const FeaturedCourses({Key? key, required this.featuredCoursesList,  this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            featuredCoursesList.length,
                (index) {
              return CoursesCard(course: featuredCoursesList[index],size:
           0.70 ,isLive: false,function: function,);
            },
          ),
          SizedBox(width: screenWidthDivided(20,context)),

        ],
      ),
    );
  }
}
