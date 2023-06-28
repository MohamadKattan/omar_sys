
import 'package:omar_system/models/user_model.dart';

class AttendanceModel {
  String id;
  String? attendableId;
  String? shipping;
  String? delivery;
  String? comment;
  String? userId;
  String? catCallRecordId;
  String? address;
  String? shifts;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  User? user;
  AttendModel? attend;
  AttendanceOrderModel? order;

  AttendanceModel({
    required this.id,
     this.attendableId,
     this.shipping,
     this.delivery,
     this.comment,
     this.userId,
     this.catCallRecordId,
     this.address,
     this.shifts,
     this.createdAt,
     this.updatedAt,
     this.deletedAt,
     this.user,
    this.attend,
    this.order

  });

  factory AttendanceModel.fromJSON(Map map) {
    return AttendanceModel(
      id : map['id'].toString(),
      attendableId: map['attendable_id'].toString(),
      shipping: map['shipping'].toString(),
      delivery: map['delivery'].toString(),
      comment: map['comment'].toString(),
      userId: map['user_id'].toString(),
      catCallRecordId: map['cat_call_record_id'].toString(),
      address: map['address'].toString(),
      shifts: map['shifts'].toString(),
      createdAt: map['created_at'].toString(),
      updatedAt: map['updated_at'].toString(),
      deletedAt: map['deleted_at'].toString(),
      user:  map['user'] != null ? User.fromJSON(map['user']) : null,
      attend: map['attendable'] != null ? AttendModel.fromJSON(map['attendable']) : null,
      order: map['order'] != null ? AttendanceOrderModel.fromJSON(map['order']) : null,

    );
  }
}


class AttendanceOrderModel {
  String id;
  String? serial;
  String? createdAt;
  String? total;
  String? paymentPay;
  String? discount;
  String? status;
  String? comment;
  String? updatedAt;

  AttendanceOrderModel({
    required this.id,
     this.serial,
     this.createdAt,
     this.total,
     this.paymentPay,
     this.discount,
     this.status,
     this.comment,
     this.updatedAt,
  });

  factory AttendanceOrderModel.fromJSON(Map map) {
    return AttendanceOrderModel(
      id : map['id'].toString(),
      serial: map['serial'].toString(),
      total: map['total'].toString(),
      paymentPay: map['paymentpay'].toString(),
      discount: map['discount'].toString(),
      status: map['status'].toString(),
      comment: map['comment'].toString(),
      createdAt: map['created_at'].toString(),
      updatedAt: map['updated_at'].toString(),
    );
  }
}


class AttendModel {
  String id;
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
  String? answerdDate;
  String? dateOfReserved;
  String? createdAt;
  String? updatedAt;
  String? interviewDate;
  String? interviewStatus;
  String? interviewData;


  AttendModel({
    required this.id,
    this.name,
    this.phone,
    this.email,
    this.city,
    this.type,
    this.agentId,
    this.phoneStatus,
    this.customerStatus,
    this.dateOfVists,
    this.comments,
    this.finalResults,
    this.catCallRecordId,
    this.dateOfCall,
    this.answerdDate,
    this.dateOfReserved,
    this.createdAt,
    this.updatedAt,
    this.interviewDate,
    this.interviewStatus,
    this.interviewData,
  });

  factory AttendModel.fromJSON(Map map) {
    return AttendModel(
      id : map['id'].toString(),
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
      answerdDate: map['answerd_date'].toString(),
      dateOfReserved: map['date_of_reserved'].toString(),
      createdAt: map['created_at'].toString(),
      updatedAt: map['updated_at'].toString(),
      interviewDate: map['interview_date'].toString(),
      interviewStatus: map['interview_status'].toString(),
      interviewData: map['interview_data'].toString(),

    );
  }
}
