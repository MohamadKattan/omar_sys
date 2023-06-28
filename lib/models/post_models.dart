
import 'package:omar_system/services/provider.dart';


class PostModels {
  String id;
  String title;
  String postContent;
  String imageID;
  String imageUrl;

  PostModels({required this.id,required this.title,required this.postContent, required this.imageID ,required this.imageUrl});

  factory PostModels.fromJSON(Map map) {
    return PostModels(
      id: map['id'].toString(),
      title: map['title'] != null ? map['title'][riverpod.read(appLang)].toString() : '',
      postContent: map['post_content'] != null ? map['post_content'][riverpod.read(appLang)].toString(): '',
      imageID: map['feature_image'].toString(),
      imageUrl: map['image_url']['image_md'].toString(),
    );
  }
}
