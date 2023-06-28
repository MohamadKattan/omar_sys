import 'package:flutter/foundation.dart';
import '../../../services/databasehelper.dart';
import '../models/course_models.dart';
import '../models/user_model.dart';
import '../services/api_links.dart';

UserController userController = UserController();

class UserController {
  List<CourseModel> userEnrolledCoursesList = [];
  List userPurchases = [];

  late User user;
  bool hasInHold = false;
  bool isLoading = true;
  bool profileIsLoading = true;
  bool hasErr = false;
  bool profileHasErr = false;

  getPurchasesData() async {
    // try {
    hasErr = false;
    userPurchases.clear();

    final userPurchasesUrlApiResponse =
        await databaseHelper.getData(userPurchasesUrl);


    userPurchases = userPurchasesUrlApiResponse.data['data']['purchases'];
    for (final purchases in userPurchases) {
      if (purchases['status'] == "onhold") {
        hasInHold = true;
      } else {
        hasInHold = false;
      }
    }
    final userEnrolledCoursesUrlApiResponse =
        await databaseHelper.getData(userEnrolledCoursesUrl);
    userEnrolledCoursesList =
        (userEnrolledCoursesUrlApiResponse.data['data']['courses'] as List)
            .map((e) => CourseModel.fromJSON(e))
            .toList();

    isLoading = false;
    if (kDebugMode) {
      print('UserController');
    }
    // } catch (e) {
    //   hasErr =  true;
    //   if (kDebugMode) {
    //     print(e);
    //   }
    //
    // }
  }

  getUserData() async {
    // try {
    profileHasErr = false;

    final userSettingsUrlApiResponse =
        await databaseHelper.getData(userSettingsUrl);

    user = User.fromJSON(userSettingsUrlApiResponse.data['data']['user']);

    profileIsLoading = false;
    if (kDebugMode) {
      print('UserController');
    }
    // } catch (e) {
    //   profileHasErr =  true;
    //   if (kDebugMode) {
    //     print(e);
    //   }
    //
    // }
  }

  editUser(id) async {
    try {
      hasErr = false;

      isLoading = false;
      if (kDebugMode) {
        print('addToCard');
      }
    } catch (e) {
      hasErr = true;
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
