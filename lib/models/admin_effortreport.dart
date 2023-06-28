class AdminEffortReport {
  List<AgentsEffort>? listAgentsEffort;
  AdminEffortReport({this.listAgentsEffort});
  AdminEffortReport.fromJson(Map<String, dynamic> json) {
    listAgentsEffort =
        List.from(json['users']).map((e) => AgentsEffort.fromJson(e)).toList();
  }
}

class AgentsEffort {
  int? agentId;
  String? agentName;
  int? effortMonth;
  int? effortDay;
  AgentsEffort(
      {this.agentId, this.agentName, this.effortDay, this.effortMonth});

  AgentsEffort.fromJson(Map<String, dynamic> json) {
    agentId = json['id'];
    agentName = json['name']??"null";
    effortMonth = json['efforts_month']??0;
    effortDay = json['efforts_day']??0;
  }
}
