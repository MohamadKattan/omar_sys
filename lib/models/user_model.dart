import '../services/provider.dart';

class User {
  final int id;
  final String? uid;
  final String? slug;
  final String name;
  final String email;
  final String? phone;
  final String? phoneVerifiedAt;
  final String? emailVerifiedAt;
  final String? fcmId;
  final String? facebook;
  final String? instagram;
  final String? website;
  final String? about;
  final String? avatarUrl;
  final String? country;
  final String? city;
  final String? gender;
  final String? jobTitle;
  final String? userType;
  final String? balance;
  final String? lang;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.uid,
    this.slug,
    this.phone,
    this.phoneVerifiedAt,
    this.emailVerifiedAt,
    this.fcmId,
    this.facebook,
    this.instagram,
    this.website,
    this.about,
    this.avatarUrl,
    this.country,
    this.city,
    this.gender,
    this.jobTitle,
    this.userType,
    this.balance,
    this.lang,
  });

  factory User.fromJSON(Map map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      uid: map['uuid'] ?? '',
      slug: map['slug'] ?? '',
      phone: map['phone'] ?? '',
      phoneVerifiedAt: map['phone_verified_at'] ?? '',
      emailVerifiedAt: map['email_verified_at'] ?? '',
      fcmId: map['fcm_id'] ?? '',
      facebook: map['facebook'] ?? '',
      instagram: map['instagram'] ?? '',
      website: map['website'] ?? '',
      about: map['about_me'] != null
          ? map['about_me'][riverpod.read(appLang)]
          : '',
      avatarUrl: map['image_url'] != null ? map['image_url']['image_md'] : '',
      country: map['country_id'].toString(),
      city: map['city'] ?? '',
      gender: map['gender'] ?? '',
      jobTitle: map['job_title'] ?? '',
      userType: map['user_type'] ?? '',
      balance: map['balance'] ?? '',
      lang: map['lang'] ?? '',
    );
  }
}
