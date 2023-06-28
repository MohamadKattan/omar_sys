import 'package:flutter/foundation.dart';
import '../../../services/databasehelper.dart';
import '../models/attendance_models.dart';
import '../models/user_model.dart';
import '../services/api_links.dart';

AttendanceController attendance = AttendanceController();

class AttendanceController {
  User? user;
  List<AttendanceModel> attendance = [];

  bool isLoading = true;
  bool hasErr = false;

  getHome() async {
    try {
      hasErr = false;

      final apiResponse = await databaseHelper.getData(attendsURL);
      if (kDebugMode) {
        print(apiResponse.data['attenda']['data'].length);
      }
      var apiRecordsList = (apiResponse.data['attenda']['data'] as List)
          .map((e) => AttendanceModel.fromJSON(e))
          .toList();
      attendance = apiRecordsList;
      // user = User.fromJSON(apiResponse.data['arr']['user']);

      isLoading = false;
      //
    } catch (e) {
      hasErr = true;
      isLoading = false;

      if (kDebugMode) {
        print(e);
      }
    }
  }
}
