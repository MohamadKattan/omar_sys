// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/foundation.dart';
import '../../../services/databasehelper.dart';
import '../models/sections_models.dart';
import '../models/user_model.dart';
import '../services/api_links.dart';

SectionsController sections = SectionsController();

class SectionsController {
  List<SectionsModel> sections = [];

  User? user;
  var data;

  bool isLoading = true;
  bool hasErr = false;


  getHome() async {

    try {
      hasErr =  false;

      final apiResponse = await databaseHelper.postData(sectionsURL,{});
      if (kDebugMode) {
        print(apiResponse.data);

      }
      var apiRecordsList =  (apiResponse.data['CatCallRecord'] as List).map((e) => SectionsModel.fromJSON(e)).toList();
      sections = apiRecordsList;
      // user = User.fromJSON(apiResponse.data['arr']['user']);
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


