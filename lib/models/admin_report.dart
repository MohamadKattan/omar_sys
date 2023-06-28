// ignore_for_file: non_constant_identifier_names

class AllReportInfo {
  AllReportInfo({
    this.answerd,
    this.answerd2,
    this.notReached,
    this.closed,
    this.follow,
    this.interested,
    this.followup,
    this.followupnum,
    this.follow2,
    this.interested2,
    this.wrongNumber,
    this.changedHisMind,
    this.reserved,
    this.interview,
    this.pendingApproval,
    this.dontCall,
    this.database,
    this.numberOfReg,
    this.users,
    this.catCallRecord,
    this.dayFollowse
  });
  int? answerd;
  int? answerd2;
  int? notReached;
  int? closed;
  int? follow;
  int? interested;
  int? followupnum;
  int? follow2;
  int? interested2;
  int? wrongNumber;
  int? changedHisMind;
  int? reserved;
  int? interview;
  int? pendingApproval;
  int? dontCall;
  int? database;
  int? numberOfReg;
  List? followup;
  List<CatCallRecord>? catCallRecord;
  Map<String, dynamic>? users;
  Map<String, dynamic>? dayFollowse;

  AllReportInfo.fromJson(Map<String, dynamic> json) {
    answerd = json['answerd'] ?? 0;
    answerd2 = json['answerd2'] ?? 0;
    notReached = json['not_reached'] ?? 0;
    closed = json['closed'] ?? 0;
    follow = json['follow'] ?? 0;
    interested = json['interested'] ?? 0;
    followup = json['followup'] ?? 0;
    followupnum = json['followupnum'] ?? 0;
    follow2 = json['follow2'] ?? 0;
    interested2 = json['interested2'] ?? 0;
    wrongNumber = json['wrong_number'] ?? 0;
    changedHisMind = json['changed_his_mind'] ?? 0;
    reserved = json['reserved'] ?? 0;
    interview = json['interview'] ?? 0;
    pendingApproval = json['pending_approval'] ?? 0;
    dontCall = json['dont_call'] ?? 0;
    database = json['database'] ?? 0;
    numberOfReg = json['number_of_reg'] ?? 0;
    users = json['users'] != null ? Map.from(json['users']) : {"null": "null"};
    dayFollowse = json['day_followse'].runtimeType!=List
        ? Map.from(json['day_followse'])
        : {};
    catCallRecord = json['CatCallRecord'] != null
        ? List.from(json['CatCallRecord'])
            .map((e) => CatCallRecord.fromJson(e))
            .toList()
        : [];
  }
}

// this class for store all user from object users  from api/call-record/report
class AgentAdminReport {
  int? userid;
  String? name;
  ImageUrl? imageUrl;
  int? pending_calls;
  int? waiting_for_your_call;
  int? number_of_reg;
  int? phone_status_blank;
  int? phone_status_answer;
  int? phone_status_not_reached;
  int? phone_status_closed;
  int? customer_status_blanks;
  int? customer_status_pending;
  int? customer_status_interested;
  int? customer_status_wrong_number;
  int? customer_status_changed_his_mind;
  int? final_results_reserved;
  int? final_results_reserved_interview;
  int? final_results_pending_approval;
  int? final_results_dont_call_again;
  int? final_results_database;
  List<DayFollowse>? listDayFollow;

  AgentAdminReport(
      {required this.userid,
      required this.name,
      required this.customer_status_blanks,
      required this.customer_status_changed_his_mind,
      required this.customer_status_interested,
      required this.customer_status_pending,
      required this.customer_status_wrong_number,
      required this.final_results_database,
      required this.final_results_dont_call_again,
      required this.final_results_pending_approval,
      required this.final_results_reserved,
      required this.final_results_reserved_interview,
      required this.imageUrl,
      required this.number_of_reg,
      required this.pending_calls,
      required this.phone_status_answer,
      required this.phone_status_blank,
      required this.phone_status_closed,
      required this.phone_status_not_reached,
      required this.waiting_for_your_call,
      required this.listDayFollow});

  AgentAdminReport.fromJson(Map<String, dynamic> json) {
    userid = json['id'] ?? 0;
    name = json['name'] ?? 'null';
    waiting_for_your_call = json['waiting_for_your_call'] ?? 0;
    number_of_reg = json['number_of_reg'] ?? 0;
    phone_status_blank = json['phone_status_blank'] ?? 0;
    phone_status_answer = json['phone_status_answer'] ?? 0;
    phone_status_not_reached = json['phone_status_not_reached'] ?? 0;
    phone_status_closed = json['phone_status_closed'] ?? 0;
    customer_status_blanks = json['customer_status_blanks'] ?? 0;
    customer_status_pending = json['customer_status_pending'] ?? 0;
    customer_status_interested = json['customer_status_interested'] ?? 0;
    customer_status_wrong_number = json['customer_status_wrong_number'] ?? 0;
    customer_status_changed_his_mind =
        json['customer_status_changed_his_mind'] ?? 0;
    final_results_reserved = json['final_results_reserved'] ?? 0;
    final_results_reserved_interview =
        json['final_results_reserved_interview'] ?? 0;
    final_results_pending_approval =
        json['final_results_pending_approval'] ?? 0;
    final_results_dont_call_again = json['final_results_dont_call_again'] ?? 0;
    final_results_database = json['final_results_database'] ?? 0;
    pending_calls = json['pending_calls'] ?? 0;
    imageUrl = ImageUrl.fromJson(json['image_url']);
    listDayFollow = json['day_followse'] != null
        ? List.from(json['day_followse'])
            .map((e) => DayFollowse.fromJson(e))
            .toList()
        : [];
  }
}

// this class for store all image one user and from  object users  in api => keyOneuser => {image_url}
class ImageUrl {
  ImageUrl({
    this.thumbnail,
    this.imageSm,
    this.imageMd,
    this.imageLg,
    this.original,
    this.full,
  });
  String? thumbnail;
  String? imageSm;
  String? imageMd;
  String? imageLg;
  String? original;
  String? full;

  ImageUrl.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'] ?? '';
    imageSm = json['image_sm'] ?? '';
    imageMd = json['image_md'] ?? '';
    imageLg = json['image_lg'] ?? '';
    original = json['original'] ?? '';
    full = json['full'] ?? '';
  }
}

// this class for store all DayFollowse one user and from  object users  in api => keyOneuser => {day_followse}
class DayFollowse {
  DayFollowse(
      {this.id,
      this.agent_id,
      this.phone_status,
      this.cat_call_record_id,
      this.customer_status,
      this.date_of_call,
      this.answerd_date,
      this.date_of_vists,
      this.interview_date,
      this.new_answerd_date,
      this.new_date});
  int? id;
  int? agent_id;
  String? phone_status;
  String? customer_status;
  String? date_of_vists;
  int? cat_call_record_id;
  String? interview_date;
  String? date_of_call;
  String? answerd_date;
  String? new_date;
  String? new_answerd_date;

  DayFollowse.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    agent_id = json['agent_id'] ?? 0;
    phone_status = json['phone_status'] ?? 'null';
    customer_status = json['customer_status'] ?? 'null';
    date_of_vists = json['date_of_vists'] ?? 'null';
    cat_call_record_id = json['cat_call_record_id'] ?? 0;
    interview_date = json['interview_date'] ?? 'null';
    date_of_call = json['date_of_call'] ?? 'null';
    answerd_date = json['answerd_date'] ?? 'null';
    new_date = json['new_date'] ?? 'null';
    new_answerd_date = json['new_answerd_date'] ?? 'null';
  }
}

// this  class for store id all CatCallRecord from api/call-record/report => CatCallRecord []
class CatCallRecord {
  int? id;
  String? title;
  CatCallRecord({this.id, this.title});

  CatCallRecord.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    title = json['title'] ?? 'null';
  }
}
