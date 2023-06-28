import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../models/categories_models.dart';
import '../../../models/course_models.dart';
import '../../../widgets/categories_card.dart';

class Categories extends StatelessWidget {
  final VoidCallback?  function;

  final List<CourseModel> liveCoursesList ;
  final List<CourseModel> featuredCoursesList ;
  final List<CategoriesModels> categoriesList;
  const Categories({Key? key, required this.categoriesList, required this.liveCoursesList, required this.featuredCoursesList,  this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: MasonryGridView.count(
        physics: const ScrollPhysics(),
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        crossAxisCount: 2,
        mainAxisSpacing: 7,
        crossAxisSpacing: 12,
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          return CategoriesCard(
            function: function,
            categoriesName: categoriesList[index].categoryName ?? '',
            categoriesId: categoriesList[index].id ?? '', liveCoursesList: liveCoursesList, featuredCoursesList: featuredCoursesList,
          );
        },
      ),
    );
  }
}
