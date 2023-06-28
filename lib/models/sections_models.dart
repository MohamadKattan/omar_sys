
class SectionsModel {
  String id;
  String title;
  String callRecordCount;
  String dayFollow;
  String dayFollow2;
  String dayFollow3;

  SectionsModel({
    required this.id,
    required this.title,
    required this.callRecordCount,
    required this.dayFollow,
    required this.dayFollow2,
    required this.dayFollow3,

  });

  factory SectionsModel.fromJSON(Map map) {
    return SectionsModel(
      id : map['id'].toString(),
      title: map['title'].toString(),
      callRecordCount: map['call_record_count'].toString(),
      dayFollow: map['day_follow'].toString(),
      dayFollow2: map['day_follow2'].toString(),
      dayFollow3: map['day_follow3'].toString(),

    );
  }
}
