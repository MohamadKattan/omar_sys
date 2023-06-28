import 'package:flutter/material.dart';
import 'package:omar_system/app_info.dart';

import '../models/course_models.dart';

class CategoriesCard extends StatelessWidget {
  final VoidCallback?  function;

  final String categoriesName;
  final String categoriesId;
  final List<CourseModel> liveCoursesList ;
  final List<CourseModel> featuredCoursesList ;
  const CategoriesCard({Key? key, required this.categoriesName, required this.categoriesId, required this.liveCoursesList, required this.featuredCoursesList,  this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //     builder: (context) => CoursesPage(function: function,slug: categoriesId ,categoriesName: categoriesName,featuredCoursesList: featuredCoursesList,liveCoursesList: liveCoursesList, search: '',isSearch:false),
        // )
        // );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular($borderRadius.toDouble()),
          border: Border.all(color: checkDarkTheme(context.m)  ? $borderDarkColor : $borderColor),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Center(
            child: Text(categoriesName),
          ),
        ),
      ),
    );
  }
}
