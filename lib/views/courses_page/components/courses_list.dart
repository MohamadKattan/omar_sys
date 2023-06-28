import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../models/course_models.dart';
import '../../../widgets/courses_card.dart';

class CoursesList extends StatelessWidget {
  final VoidCallback?  function;

  final List<CourseModel> coursesList;
  const CoursesList({Key? key, required this.coursesList,  this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width,
      child: MasonryGridView.count(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        mainAxisSpacing: 7,
        crossAxisSpacing: 12,
        itemCount: coursesList.length,
        itemBuilder: (context, index) {
          return CoursesCard(course: coursesList[index],size:
          0.48 ,isLive: false,function: function,);
        },
      ),
    );
  }
}
