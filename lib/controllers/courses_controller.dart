import 'package:flutter/foundation.dart';
import '../models/categories_models.dart';
import '../models/course_models.dart';
import '../../../services/databasehelper.dart';
import '../services/api_links.dart';

CoursesPageController coursesController = CoursesPageController();

class CoursesPageController {
  List<CourseModel> coursesList = [];
  List<CategoriesModels> coursesCategoriesList = [];


  bool isLoading = true;
  bool hasErr = false;

  getCourses(slug) async {
    // try {
      coursesList.clear();
      coursesCategoriesList.clear();
      hasErr =  false;
      isLoading = true;


      final coursesApiResponse = await databaseHelper.getData('$categoriesURL/$slug');
      coursesList =  (coursesApiResponse.data['data']['category']['courses'] as List).map((e) => CourseModel.fromJSON(e)).toList();
      coursesCategoriesList =  (coursesApiResponse.data['data']['category']['sub_categories'] as List).map((e) => CategoriesModels.fromJSON(e)).toList();

      isLoading = false;
      if (kDebugMode) {
        print(' Courses Page Controller');
      }
    // } catch (e) {
    //   hasErr =  true;
    //   if (kDebugMode) {
    //     print(e);
    //   }
    // }
  }

  getSearchResult(search) async {
    try {
      coursesList.clear();
      coursesCategoriesList.clear();
      hasErr =  false;
      isLoading = true;


      final coursesApiResponse = await databaseHelper.getData('$searchURL$search');
      coursesList =  (coursesApiResponse.data['data']['courses']['data'] as List).map((e) => CourseModel.fromJSON(e)).toList();
      coursesCategoriesList =  (coursesApiResponse.data['data']['categories'] as List).map((e) => CategoriesModels.fromJSON(e)).toList();

      isLoading = false;
      if (kDebugMode) {
        print('getSearchResult');
      }
    } catch (e) {
      hasErr =  true;
      if (kDebugMode) {
        print(e);
      }
    }
  }
}


