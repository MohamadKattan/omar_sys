
import 'package:omar_system/models/user_model.dart';

class OrderModel {
  String id;
  String? orderableId;
  String? serial;
  String? total;
  String? status;
  String? discount;
  String? dueDate;
  String? userId;
  String? paymentPay;
  String? rests;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  User? user;
  OrderSectionsModel? sections;
  AttendModel? attend;
  List<PaymentModel>? payment;

  OrderModel({
    required this.id,
    this.orderableId,
    this.serial,
    this.total,
    this.status,
    this.discount,
    this.dueDate,
    this.userId,
    this.paymentPay,
    this.rests,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.user,
    this.payment,
    this.attend,
    this.sections,

  });

  factory OrderModel.fromJSON(Map map) {
    return OrderModel(
      id : map['id'].toString(),
      orderableId: map['orderable_id'].toString(),
      serial: map['serial'].toString(),
      total: map['total'].toString(),
      status: map['status'].toString(),
      discount: map['discount'].toString(),
      dueDate: map['due_date'].toString(),
      userId: map['user_id'].toString(),
      paymentPay: map['shifts'].toString(),
      rests: map['rest'].toString(),
      createdAt: map['created_at'].toString(),
      updatedAt: map['updated_at'].toString(),
      deletedAt: map['deleted_at'].toString(),
      user: map['user'] != null ? User.fromJSON(map['user']) : null,
      sections: map['orderable']['attendable'] != null ? OrderSectionsModel.fromJSON(map['orderable']['cat']):null,
      attend: map['orderable']['attendable'] != null ? AttendModel.fromJSON(map['orderable']['attendable']) : null,
      payment:map['payment'] !=null ? (map['payment'] as List).map((e) => PaymentModel.fromJSON(e)).toList() : [] ,

    );
  }
}

class PaymentModel {
  String id;
  String? paymentableId;
  String? price;
  String? comment;
  String? userId;
  String? dueDate;
  String? paymentDate;
  String? method;
  String? createdAt;
  String? updatedAt;

  PaymentModel({
    required this.id,
    this.paymentableId,
    this.price,
    this.comment,
    this.userId,
    this.dueDate,
    this.paymentDate,
    this.method,
    this.createdAt,
    this.updatedAt,
  });

  factory PaymentModel.fromJSON(Map map) {
    return PaymentModel(
      id : map['id'].toString(),
      paymentableId: map['paymentable_id'].toString(),
      price: map['price'].toString(),
      comment: map['comment'].toString(),
      userId: map['user_id'].toString(),
      dueDate: map['due_date'].toString(),
      paymentDate: map['payment_date'].toString(),
      method: map['method'].toString(),
      createdAt: map['created_at'].toString(),
      updatedAt: map['updated_at'].toString(),

    );
  }
}

class OrderSectionsModel {
  String id;
  String title;
  String createdAt;

  OrderSectionsModel({
    required this.id,
    required this.title,
    required this.createdAt,


  });

  factory OrderSectionsModel.fromJSON(Map map) {
    return OrderSectionsModel(
      id : map['id'].toString(),
      title: map['title'].toString(),
      createdAt: map['created_at'].toString(),
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

