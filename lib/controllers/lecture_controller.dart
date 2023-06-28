import 'package:flutter/foundation.dart';
import '../../../services/databasehelper.dart';
import '../models/lecture_models.dart';
import '../services/api_links.dart';

LecturePageController lectureController = LecturePageController();

class LecturePageController {

  late LectureModel  lecture;

  late String nextId ;
  late String completedPercent = '' ;
  late String previousId ;
  late String currentLectureId = '';

  bool hasNext = true;
  bool hasPrevious = false;

  bool isLoading = true;
  bool hasErr = false;
  bool firstOpen = true;

  getLecture(slug,id) async {
    try {

      hasErr =  false;
      isLoading = true;

      currentLectureId= id;

      final coursesApiResponse = await databaseHelper.getData('$lectureViewURL/$slug/lecture/$id');
      lecture = LectureModel.fromJSON(coursesApiResponse.data['data']['lecture']);

      hasNext = coursesApiResponse.data['data']['next'] != null ? true : false;
      hasPrevious = coursesApiResponse.data['data']['previous'] != null ? true : false;

      nextId = (coursesApiResponse.data['data']['next'] != null ? coursesApiResponse.data['data']['next']['id'].toString() : '');
      previousId = (coursesApiResponse.data['data']['previous'] != null ? coursesApiResponse.data['data']['previous']['id'].toString() : '');
      completedPercent = coursesApiResponse.data['data']['completed_percent'].toString();


      isLoading = false;
      firstOpen = false;
   
    } catch (e) {
      hasErr =  true;
      if (kDebugMode) {
        print(e);
      }
    }
  }
  markContentComplete(id) async{
    try {
      hasErr =  false;
      isLoading = true;

      final contentCompleteApiResponse = await databaseHelper.getData('$contentCompleteURL/$id');
      if (kDebugMode) {
        print(contentCompleteApiResponse);
      }
    }catch (e) {
      hasErr =  true;
      if (kDebugMode) {
        print(e);
      }
    }
  }


  markCourseComplete(id) async {
    try {
      hasErr =  false;
      final contentCompleteApiResponse = await databaseHelper.postData('$coursesCompleteURL/$id',{});
      if (kDebugMode) {
        print(contentCompleteApiResponse);
      }
    }catch (e) {
      hasErr =  true;
      if (kDebugMode) {
        print(e);
      }
    }
  }


}


