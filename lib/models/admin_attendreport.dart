class AdminAttendreport {
  AdminAttendreport(
      {this.users,
      this.allPaymentDue,
      this.allthisday,
      this.totalnumberReg,
      this.totalnumberRegPaid,
      this.totalnumberRegUnPaid,
      this.totalCancel,
      this.totalPanding,
      this.totalActive,
      this.totalAmountState,
      this.totalPaidState,
      this.totalRemainingSatate,
      this.netIncome,
      this.nOfRegistration,
      this.nOfCancel,
      this.nOfTotleVal,
      this.cancellation,
      this.nOfCustome,
      this.nOfCustomeNoFilter,
      this.balanceValue,
      this.balanceValueNoFilter,
      this.nOfCustomerNoFilterCan,
      this.balanceValueNoFilterCan,
      this.amountCacncelNoFillter,
      this.amountPandingNoFilter,
      this.netIncomeCan,
      this.thetotalNumber,
      this.totalForTheDay,
      this.totalNumberOrderPaid,
      this.totalNumberOrderRemaining});
  Map<String, dynamic>? users;
  int? allPaymentDue;
  int? allthisday;
  int? totalnumberReg;
  int? totalnumberRegPaid;
  int? totalnumberRegUnPaid;
  int? totalCancel;
  int? totalPanding;
  int? totalActive;
  int? totalAmountState;
  int? totalPaidState;
  int? totalRemainingSatate;
  int? netIncome;
  int? nOfRegistration;
  int? nOfCancel;
  int? nOfTotleVal;
  int? cancellation;
  int? nOfCustome;
  int? balanceValue;
  int? nOfCustomeNoFilter;
  int? balanceValueNoFilter;
  int? nOfCustomerNoFilterCan;
  int? balanceValueNoFilterCan;
  int? amountCacncelNoFillter;
  int? amountPandingNoFilter;
  int? netIncomeCan;
  int? thetotalNumber;
  int? totalForTheDay;
  int? totalNumberOrderPaid;
  int? totalNumberOrderRemaining;

  AdminAttendreport.fromJson(Map<String, dynamic> json) {
    users = json['users'].runtimeType != List ? Map.from(json['users']) : {};
    allPaymentDue = json['allPaymentDue'] ?? 0;
    allthisday = json['allthisday'] ?? 0;
    totalnumberReg = json['regall'] ?? 0;
    totalnumberRegPaid = json['regpaid'] ?? 0;
    totalnumberRegUnPaid = json['regunpaid'] ?? 0;
    totalCancel = json['Countcancel'] ?? 0;
    totalPanding = json['pending'] ?? 0;
    totalActive = json['CountActive'] ?? 0;
    totalAmountState = json['total2all'] ?? 0;
    totalPaidState = json['paid2all'] ?? 0;
    totalRemainingSatate = json['rest2all'] ?? 0;
    netIncome = json['TotalPaid'] ?? 0;
    nOfRegistration = json['regall'] ?? 0;
    nOfCancel = json['Countcancel'] ?? 0;
    nOfTotleVal = json['total2all'] ?? 0;
    cancellation = json['cancel'] ?? 0;
    nOfCustome = json['countAttendRestFilter'] ?? 0;
    balanceValue = json['rest2all'];
    nOfCustomeNoFilter = json['countAttendRest'] ?? 0;
    balanceValueNoFilter = json['amountAttendRest'] ?? 0;
    nOfCustomerNoFilterCan = json['CancellationCount'] ?? 0;
    balanceValueNoFilterCan = json['CancellationBalacne'] ?? 0;
    amountCacncelNoFillter = json['CountcancelAmount'] ?? 0;
    amountPandingNoFilter = json['Countpending'] ?? 0;
    netIncomeCan = json['TotalPaid'] ?? 0;
    thetotalNumber = json['allPaymentDue'] ?? 0;
    totalForTheDay = json['allthisday'] ?? 0;
    totalNumberOrderPaid = json['allispaid'] ?? 0;
    totalNumberOrderRemaining = json['allisRest'] ?? 0;
  }
}

class UsersAttends {
  UsersAttends(
      {this.id,
      this.name,
      this.imageUrl,
      this.attend,
      this.totalAmount,
      this.totalPaid,
      this.totalRemaining});
  int? id;
  String? name;
  String? imageUrl;
  List<Attend>? attend;
  int? totalAmount;
  int? totalPaid;
  int? totalRemaining;

  UsersAttends.fromJson(Map<String, dynamic> json) {
    totalAmount = json['total'];
    totalPaid = json['paid'];
    totalRemaining = json['rest'];
    id = json['user']['id'];
    name = json['user']['name'];
    imageUrl = json['user']['image_url']['thumbnail'];
    // attend = List.from(json['user']['attend'])
    //     .map((e) => Attend.fromJson(e))
    //     .toList();
  }
}

class Attend {
  Attend({
    this.customerId,
    this.shipping,
    this.delivery,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.order,
  });
  int? customerId;
  String? shipping;
  String? delivery;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  Order? order;

  Attend.fromJson(Map<String, dynamic> json) {
    customerId = json['id'];
    shipping = json['shipping'];
    delivery = json['delivery'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    order = Order.fromJson(json['order']);
  }
}

class Order {
  Order({
    required this.totalPrice,
    required this.status,
    required this.discount,
    required this.payment,
  });
  int? totalPrice;
  String? status;
  int? discount;
  List<Payment>? payment;

  Order.fromJson(Map<String, dynamic> json) {
    totalPrice = json['total'];
    status = json['status'];
    discount = json['discount'];
    payment =
        List.from(json['payment']).map((e) => Payment.fromJson(e)).toList();
  }
}

class Payment {
  Payment({this.customerPaid, this.paymentMethod, this.paymentDate});
  String? customerPaid;
  String? paymentMethod;
  String? paymentDate;

  Payment.fromJson(Map<String, dynamic> json) {
    customerPaid = json['price'];
    paymentMethod = json['method'];
    paymentDate = json['payment_date'];
  }
}
