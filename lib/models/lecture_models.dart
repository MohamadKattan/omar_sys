import 'dart:convert';
import 'package:omar_system/models/quiz_models.dart';
import '../services/provider.dart';


class LectureSectionsModel {
  String id;String sectionName; String courseId; String unlockDate;
  String unlockDays; List<LectureModel> items;

  LectureSectionsModel(
      {required this.id, required this.sectionName, required this.courseId,required this.unlockDate,
        required this.unlockDays,required this.items
      });

  factory LectureSectionsModel.fromJSON(Map map) {
    return LectureSectionsModel(
      id: map['id'].toString(),
      courseId: map['course_id'].toString() ,
      sectionName : map['section_name'] != null ? map['section_name'][riverpod.read(appLang)].toString() :"",
      unlockDate: map['unlock_date'].toString() ,
      unlockDays: map['unlock_days'] .toString() ,
      items:map['items'] != null ? (map['items'] as List) .map((e) => LectureModel.fromJSON(e)).toList() : [],
    );
  }
}
class LectureModel {
  String id;String userId; String courseId;String sectionId; String slug;String? videoUrl;bool? hasVideo;
  String title;String text; String itemType; Map videoSrc; bool isPreview; List? attachments; List? discussions;bool? isCompleted;
  QuizInfoModels? options;
  LectureModel(
      {required this.id, required this.userId, required this.courseId,required this.sectionId,
        required this.slug,required this.title,required this.text,required this.videoSrc, required this.itemType,
        required this.isPreview,  this.attachments , this.discussions,this.videoUrl, this.hasVideo , this.isCompleted,this.options});

  factory LectureModel.fromJSON(Map map) {
    return LectureModel(
      id: map['id'].toString() ,
      userId: map['user_id'].toString() ,
      courseId: map['course_id'].toString() ,
      sectionId: map['section_id'].toString() ,
      slug: map['slug'].toString() ,
      title:map['title'] != null ? map['title'][riverpod.read(appLang)].toString() :"",
      text: map['text'] != null ?map['text'][riverpod.read(appLang)].toString() : "",
      videoSrc: map['video_src'] != null ? json.decode(map['video_src']) : {},
      itemType: map['item_type'].toString(),
      isPreview: map['is_preview'] != null? map['is_preview'] == '1' ? true : false: false,
      videoUrl: map['video_url'] != false ? map['video_url'] :'',
      attachments: map['attachments'] ?? [],
      discussions: map['discussions'] ?? [],
      hasVideo: map['video_src'] == null ? false : true,
      options:map['options'] != null ? QuizInfoModels.fromJSON(json.decode(map['options'])) :null,
      isCompleted: map['is_completed'] == false || map['is_completed'] == null ? false : true,
    );
  }
}
