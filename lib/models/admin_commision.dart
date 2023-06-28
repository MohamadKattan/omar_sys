class AdminCommisison {
  List<AgentsInfo>? agentsInfo;
  List<CountPayment>? countPayment;
  List<CommsionsPending>? commsionsPending;
  List<Commsions>? commision;
  AdminCommisison(
      {this.agentsInfo,
      this.countPayment,
      this.commsionsPending,
      this.commision});

  AdminCommisison.fromJson(Map<String, dynamic> json) {
    agentsInfo =
        List.from(json['agent']).map((e) => AgentsInfo.fromJson(e)).toList();

    countPayment = List.from(json['countPayment'])
        .map((e) => CountPayment.fromJson(e))
        .toList();

    commsionsPending = List.from(json['commsionsPending'])
        .map((e) => CommsionsPending.fromJson(e))
        .toList();

    commision =
        List.from(json['commsions']).map((e) => Commsions.fromJson(e)).toList();
  }
}

class AgentsInfo {
  String? name;
  int? agentId;
  AgentsInfo({this.name, this.agentId});

  AgentsInfo.fromJson(Map<String, dynamic> json) {
    agentId = json['id'];
    name = json['name'];
  }
}

class CountPayment {
  int? userId;
  int? count;
  int? countR;
  CountPayment({this.userId, this.count, this.countR});

  CountPayment.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'] ?? 0;
    count = json['count'] ?? 0;
    countR = json['countR'] ?? 0;
  }
}

class CommsionsPending {
  int? userId;
  String?
      price; //=> convert to String dataType in api some times int some time double

  CommsionsPending({this.userId, this.price});

  CommsionsPending.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    price = json['price'].toString();
  }
}

class Commsions {
  int? userId;
  String? priceCurrentMonth; //=> convert to String dataType in api some times int some time double
  Commsions({this.userId, this.priceCurrentMonth});
  Commsions.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    priceCurrentMonth = json['price'].toString();
  }
}

// this class for store all data in one Object after check user id  beteen all class from above *(api relation  bad)
class CommsionsEndOfResult {
  int? id;
  String? agentName;
  int? totleCount;
  int? remainingCount;
  String? expextedcommision;
  String? commisionMonth;
  CommsionsEndOfResult(
      {this.agentName,
      this.commisionMonth,
      this.expextedcommision,
      this.remainingCount,
      this.totleCount});
  CommsionsEndOfResult.fromMap(Map<String, dynamic> map) {
    id = map['id'] ?? 0;
    agentName = map['name'] ?? 'null';
    totleCount = map['count'] ?? 0;
    remainingCount = map['countR'] ?? 0;
    expextedcommision = map['commsionsPending'] ?? '0';
    commisionMonth = map['priceCurrentMonth'] ?? '0';
  }
}
