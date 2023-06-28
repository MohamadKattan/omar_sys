

import 'package:omar_system/models/user_model.dart';

class CallRecordModels {
  String? id;
  String? name;
  String? phone;
  String? email;
  String? city;
  String? type;
  String? agentId;
  String? phoneStatus;
  String? customerStatus;
  String? dateOfVists;
  String? comments;
  String? finalResults;
  String? catCallRecordId;
  String? dateOfCall;
  String? listFollow;
  String? answerdDate;
  String? dateOfReserved;
  String? sendEmail;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? interviewDate;
  String? interviewStatus;
  String? interviewData;
  User? agent;

  CallRecordModels({
    this.id,
    this.name,
    this.phone,
    this.city,
    this.email,
    this.type,
    this.agentId,
    this.phoneStatus,
    this.customerStatus,
    this.dateOfVists,
    this.comments,
    this.finalResults,
    this.catCallRecordId,
    this.dateOfCall,
    this.listFollow,
    this.answerdDate,
    this.dateOfReserved,
    this.sendEmail,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.interviewDate,
    this.interviewStatus,
    this.interviewData,
    this.agent
  });

  factory CallRecordModels.fromJSON(Map map) {
    return CallRecordModels(
      id: map['id'].toString(),
      name: map['name'].toString(),
      phone: map['phone'].toString(),
      email: map['email'].toString(),
      city: map['city'].toString(),
      type: map['type'].toString(),
      agentId: map['agent_id'].toString(),
      phoneStatus: map['phone_status'].toString(),
      customerStatus: map['customer_status'].toString(),
      dateOfVists: map['date_of_vists'].toString(),
      comments: map['comments'].toString(),
      finalResults: map['final_results'].toString(),
      catCallRecordId: map['cat_call_record_id'].toString(),
      dateOfCall: map['date_of_call'].toString(),
      listFollow: map['listfollow'].toString(),
      answerdDate: map['answerd_date'].toString(),
      dateOfReserved: map['date_of_reserved'].toString(),
      sendEmail: map['send_email'].toString(),
      createdAt: map['created_at'].toString(),
      updatedAt: map['updated_at'].toString(),
      deletedAt: map['deleted_at'].toString(),
      interviewDate: map['interview_date'].toString(),
      interviewStatus: map['interview_status'].toString(),
      interviewData: map['interview_data'].toString(),
      agent: map['agent'] != null ? User.fromJSON(map['agent']) : null,

    );
  }
}
