import 'package:omar_system/services/provider.dart';


class CategoriesModels {
  String? id;
  String? slug;
  String? imageId;
  String? categoryName;

  CategoriesModels({ this.id, this.imageId, this.categoryName,this.slug});

  factory CategoriesModels.fromJSON(Map map) {
    return CategoriesModels(
      id: map['id'].toString(),
      slug: map['slug'].toString(),
      categoryName: map['category_name'] != null ? map['category_name'][riverpod.read(appLang)].toString(): "",
      imageId: map['icon_class'] != null ? map['icon_class'].toString() : "",
    );
  }
}
