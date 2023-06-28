// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/foundation.dart';
import '../models/call_records_models.dart';
import '../../../services/databasehelper.dart';
import '../models/categories_models.dart';
import '../models/course_models.dart';
import '../models/post_models.dart';
import '../models/slider_models.dart';
import '../models/user_model.dart';
import '../services/api_links.dart';

HomeController homeController = HomeController();

class HomeController {
  List<CallRecordModels> callRecords = [];
  List<CourseModel> newCoursesList = [];
  List<CourseModel> liveCoursesList = [];
  List<CourseModel> featuredCoursesList = [];
  List<CategoriesModels> categoriesList = [];
  List<PostModels> postsList = [];
  List<SliderModel> sliderList = [];
  User? user;
  var data;

  bool isLoading = true;
  bool hasErr = false;


  getHome() async {

    try {
      hasErr =  false;

      final apiResponse = await databaseHelper.getData(homeURL);

      var apiRecordsList =  (apiResponse.data['arr']['day_follow_data'] as List).map((e) => CallRecordModels.fromJSON(e)).toList();
      callRecords = apiRecordsList;
      user = User.fromJSON(apiResponse.data['arr']['user']);
      data = apiResponse.data ;

      isLoading = false;
    //
    } catch (e) {
      hasErr =  true;
      if (kDebugMode) {
        print(e);

      }

    }
  }
}


