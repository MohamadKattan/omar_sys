import 'dart:convert';
import 'package:omar_system/services/provider.dart';

class CourseModel {
  String title;
  String id;
  String slug;
  String imageId;
  String imageUrl;
  String shortDescription;
  String description;
  String benefits;
  String requirements;
  String pricePlan;
  String price;
  String salePrice;
  String videoUrl;
  String totalLectures;
  String totalAssignments;
  String totalQuiz;
  String ratingValue;
  String type;
  String authorName;
  String authorImage;
  String authorPhoto;
  String category;
  String liveClassSchedule;
  String liveClassMeetingId;
  String liveClassPassword;
  String liveClassEndDate;
  String liveClassNote;
  String? completedPercent;
  String? continueId;

  Map videoSrc;
  bool liveClassEndReg;
  bool requireEnroll;
  bool requireLogin;
  bool isFeatured;
  bool isLive;
  bool isRecorded;
  bool isLiveAndRecorded;
  bool inCard;
  bool inWishlist;
  bool isEnrolled;
  bool isOnHold;

  CourseModel(
      {required this.title,
      required this.imageId,
      required this.id,
      required this.imageUrl,
      required this.inCard,
      required this.inWishlist,
      required this.isEnrolled,
      required this.isOnHold,
      required this.shortDescription,
      required this.authorImage,
      required this.description,
      required this.pricePlan,
      required this.benefits,
      required this.videoSrc,
      required this.videoUrl,
      required this.salePrice,
      required this.price,
      required this.requireEnroll,
      required this.requireLogin,
      required this.requirements,
      required this.isFeatured,
      required this.totalLectures,
      required this.totalAssignments,
      required this.totalQuiz,
      required this.ratingValue,
      required this.type,
      required this.authorName,
      required this.authorPhoto,
      required this.category,
      required this.liveClassSchedule,
      required this.liveClassMeetingId,
      required this.liveClassPassword,
      required this.liveClassNote,
      required this.liveClassEndReg,
      required this.liveClassEndDate,
      required this.isLive,
      required this.isLiveAndRecorded,
      required this.isRecorded,
      required this.slug,
      this.completedPercent, this.continueId});

  factory CourseModel.fromJSON(Map map) {
    // final Locale appLocale = Localizations.localeOf(context);

    return CourseModel(
      title: map['title'] != null? map['title'][riverpod.read(appLang)].toString() : "",
      id: map['id'].toString(),
      slug: map['slug'].toString(),
      imageId:  map['thumbnail_id'] != null ? map['thumbnail_id'].toString() : '',
      imageUrl: map['image_url'] != null? map['image_url']['image_md'].toString() : '',
      shortDescription: map['short_description'] != null? map['short_description'][riverpod.read(appLang)].toString() : "",
      description: map['description'] != null ? map['description'][riverpod.read(appLang)].toString(): "",
      requirements: map['requirements'] != null ? map['requirements'][riverpod.read(appLang)].toString()   : "",
      benefits: map['benefits'] != null ? map['benefits'][riverpod.read(appLang)].toString() : "",
      pricePlan:map['price_plan'] != null ? map['price_plan'].toString() : "",
      price:map['price'] != null ?  map['price'].toString() : '0',
      salePrice:  map['sale_price'] != null ?  map['sale_price'].toString()  : '0',
      videoUrl: map['video_url'] != null ? map['video_url'].toString() : "",
      videoSrc: map['video_src'] != null ? json.decode(map['video_src']) : {},
      requireEnroll: map['require_enroll'] != null? map['require_enroll'] == '1' ? true : false: false,
      requireLogin: map['require_login'] != null ? map['require_login'] == '1'  ? true : false : false,
      inCard: map['in_cart']  == true || false ? map['in_cart'] : false,
      inWishlist: map['in_wishlist']  == true || false ?  map['in_wishlist'] : false,
      isEnrolled: map['is_enrolled']  == true || false ?  map['is_enrolled'] : false,
      isOnHold: map['is_on_hold']  == true || false ?  map['is_on_hold'] : false,
      isFeatured: map['is_featured'] == '1' ? true : false,
      totalLectures:  map['total_lectures'] != null ? map['total_lectures'].toString() : '',
      totalAssignments: map['total_assignments'] != null ? map['total_assignments'].toString(): '',
      totalQuiz: map['total_quiz'] != null ? map['total_quiz'].toString(): '',
      ratingValue: map['rating_value'] != null ? map['rating_value'].toString(): '',
      type: map['type'] != null ? map['type'].toString() : '',
      isLive: map['type'] == 'live' ? true : false,
      isRecorded: map['type'] == 'recorded' ? true : false,
      isLiveAndRecorded: map['type'] == 'live_recorded' ? true : false,
      authorName: map['author'] != null ? map['author']['name'].toString(): '',
      authorImage: map['author'] != null ? map['author']['image_url']['image_md'].toString(): '',
      authorPhoto: map['author'] != null ? map['author']['photo'].toString(): '',
      category: map['category'] != null ? map['category']['category_name'][riverpod.read(appLang)].toString(): '',
      liveClassSchedule: map['liveclass'] != null? map['liveclass']['schedule'].toString() : '',
      liveClassMeetingId: map['liveclass'] != null ? map['liveclass']['meetingid'].toString() : '',
      liveClassPassword: map['liveclass'] != null? map['liveclass']['password'].toString(): '',
      liveClassNote: map['liveclass'] != null ? map['liveclass']['note'].toString() : '',
      liveClassEndReg: map['liveclass'] != null   ? map['liveclass']['end_reg'] == '1'   ? true : false : false,
      liveClassEndDate: map['liveclass'] != null ? map['liveclass']['end_date'].toString(): '',

      continueId: map['continue_id'] != false ? map['continue_id'].toString(): '',
      completedPercent: map['completed_percent'] != null ? map['completed_percent'].toString(): '0',

    );
  }
}
