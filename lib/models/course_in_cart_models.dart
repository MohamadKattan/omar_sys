
class InCardModels {
  String id;
  String courseId;
  String title;
  String price;
  String originalPrice;
  String type;
  String imageUrl;

  InCardModels({required this.id,required this.title,required this.courseId, required this.price ,required this.originalPrice ,required this.imageUrl, required this.type });

  factory InCardModels.fromJSON(Map map) {
    return InCardModels(
      id: map['id'].toString(),
      courseId: map['course_id'].toString() ,
      title: map['title'] != null ? map['title'].toString(): '',
      price: map['price'] != null ? map['price'].toString(): '',
      originalPrice: map['original_price'] != null ? map['original_price'].toString(): '',
      type: map['type'] != null ? map['type'].toString(): '',
      imageUrl: map['thumbnail'] != null ? map['thumbnail'].toString(): '',
    );
  }
}
