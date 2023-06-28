import 'package:omar_system/services/provider.dart';

class SliderModel {
  String id;
  String photoId;
  String imageUrl;

  SliderModel({ required this.id, required this.photoId,required this.imageUrl});

  factory SliderModel.fromJSON(Map map) {
    return SliderModel(
      id : map['id'].toString(),
      photoId: map['photo_id'][riverpod.read(appLang)].toString(),
      imageUrl: map['image_url']['image_md'].toString(),

    );
  }
}
