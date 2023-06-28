import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omar_system/app_info.dart';
import 'package:omar_system/controllers/home_controller.dart';
import 'package:omar_system/size_config.dart';
import '../../controllers/courses_controller.dart';
import '../../models/course_models.dart';
import '../../widgets/title_widget.dart';
import '../errors/no_data.dart';
import '../home_page/components/featured_courses.dart';
import '../home_page/components/live_courses.dart';
import 'components/shimmer.dart';
import 'components/courses_categories.dart';
import 'components/courses_list.dart';

class CoursesPage extends StatefulWidget {
  final VoidCallback?  function;

  static String routeName = "/coursePage";
  final String? slug,search;
  final String? categoriesName;
  final bool? isSearch;
  final List<CourseModel>? liveCoursesList ;
  final List<CourseModel>? featuredCoursesList ;

  const CoursesPage({Key? key, this.slug, this.categoriesName, this.featuredCoursesList,  this.liveCoursesList,   this.search,   this.isSearch,  this.function})
      : super(key: key);

  @override
  State<CoursesPage> createState() => _SingleCoursePageState();
}

class _SingleCoursePageState extends State<CoursesPage> {
  refresh() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    if (!widget.isSearch!){
      coursesController.getCourses(widget.slug ?? '').then((v) {
        if (coursesController.hasErr) {
          refresh();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(context.t!.weHaveProblem)));
        } else {
          refresh();
        }
      });
    } else{
      coursesController.getSearchResult(widget.search ?? '').then((v) {
        if (coursesController.hasErr) {
          refresh();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(context.t!.weHaveProblem)));
        } else {
          refresh();
        }
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          systemOverlayStyle : checkDarkTheme(context.m)  ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
        backgroundColor: checkDarkTheme(context.m)  ? $homeNavBarDarkColor : $homeNavBarColor,
        iconTheme:  IconThemeData(color: checkDarkTheme(context.m)  ? $homeNavBarTextDarkColor : $homeNavBarTextColor),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 650),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidthMultiply(0.05, context)),
            child: ListView(
              children: [
                if (coursesController.isLoading) const CoursePageShimmer(),
                SizedBox(
                  height: screenHeightMultiply(0.04, context),
                ),
                if (!coursesController.isLoading)
                  Text(
                    widget.isSearch! ? widget.search ?? ''  : widget.categoriesName ?? '',
                    style: TextStyle(  fontSize: screenWidthDivided(20, context),fontWeight: FontWeight.w600),
                  ),
                if (coursesController.coursesList.isEmpty && !coursesController.isLoading) const NoFollowUpData(),

                if (coursesController.coursesCategoriesList.isNotEmpty) SizedBox( height: screenHeightMultiply(0.03, context), ),
                if (coursesController.coursesCategoriesList.isNotEmpty)
                  CoursesCategories( coursesCategoriesList: coursesController.coursesCategoriesList, featuredCoursesList: homeController.featuredCoursesList,liveCoursesList: homeController.liveCoursesList, function: widget.function,),
                if (coursesController.coursesList.isNotEmpty) SizedBox( height: screenHeightMultiply(0.02, context), ),
                if (coursesController.coursesList.isNotEmpty) TitleWidget(title: context.t!.coursesList,haveBorder: false, ),
                if (coursesController.coursesList.isNotEmpty)  CoursesList( coursesList:coursesController.coursesList, function: widget.function ),


                if (widget.featuredCoursesList!.isNotEmpty)
                  SizedBox(  height: screenHeightMultiply(0.02, context),  ),

                if (widget.featuredCoursesList!.isNotEmpty)
                  TitleWidget(  title: context.t!.featuredCourses,haveBorder: false,  ),

                if (widget.featuredCoursesList!.isNotEmpty)
                  FeaturedCourses( featuredCoursesList: widget.featuredCoursesList!, function: widget.function,),

                if (widget.liveCoursesList!.isNotEmpty)
                  SizedBox( height: screenHeightMultiply(0.01, context), ),
                if (widget.liveCoursesList!.isNotEmpty)
                  TitleWidget(title: context.t!.liveCourses,haveBorder: false,),
                if (widget.liveCoursesList!.isNotEmpty)
                  LiveCourses(liveCoursesList:  widget.liveCoursesList!,function: widget.function,  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
