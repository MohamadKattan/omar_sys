import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:omar_system/models/admin_effortreport.dart';
import 'package:omar_system/models/admin_report.dart';

import '../models/admin_attendreport.dart';
import '../models/admin_commision.dart';

final riverpod = ProviderContainer();

final tokenState = StateProvider<bool>((ref) => false);
final adminState = StateProvider<String>((ref) => 'null');
final homeFirstOpen = StateProvider<bool>((ref) => true);
final sectionFirstOpen = StateProvider<bool>((ref) => true);
final attendFirstOpen = StateProvider<bool>((ref) => true);
final billingFirstOpen = StateProvider<bool>((ref) => true);
final myCourseFirstOpen = StateProvider<bool>((ref) => true);
final profileFirstOpen = StateProvider<bool>((ref) => true);

final isDarkMode = StateProvider<bool>((ref) => false);
final appThemeMode = StateProvider<ThemeMode>((ref) => ThemeMode.system);

final appLang = StateProvider<String>((ref) => 'ar');
final selectedIndex = StateProvider<int>((ref) => 0);
final inCartNumber = StateProvider<int>((ref) => 0);

final themeModeProvider = ChangeNotifierProvider((ref) => ChangeThemeMode());

class ChangeThemeMode extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  void changeTheme(ThemeMode newMode) {
    themeMode = newMode;
    notifyListeners();
  }
}

class ThemeModel extends ChangeNotifier {
  ThemeMode _mode;
  ThemeMode get mode => _mode;
  ThemeModel({ThemeMode mode = ThemeMode.light}) : _mode = mode;

  toggleMode() {
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

// ===============this class for listing to state changing============
class ProviderListiner with ChangeNotifier, DiagnosticableTreeMixin {
// this method for notify data from api all record
  AllReportInfo _allReportInfo = AllReportInfo();
  AllReportInfo get allReportInfo => _allReportInfo;
  void addAllReportInfo(AllReportInfo valOf) {
    _allReportInfo = valOf;
    notifyListeners();
  }

// this method for update index of pageView
  int _indexPageView = 0;
  int get indexPageView => _indexPageView;
  void updateInedxOfPageView(int index) {
    _indexPageView = index;
    notifyListeners();
  }

  // this method for add agent from api all record pramter users
  final List<AgentAdminReport> _listOfAgent = [];
  List<AgentAdminReport> get listOfAgent => _listOfAgent;
  void addAgentToList(AgentAdminReport valOf) {
    _listOfAgent.add(valOf);
    notifyListeners();
  }

  void cleanListOfAgents() async {
    _listOfAgent.clear();
    notifyListeners();
  }

  // list of date for pick and set in dailoge api filtter
  List<DateTime?> _listOfDate = [DateTime.now()];
  List<DateTime?> get listOfDate => _listOfDate;
  void updateListOfDate(List<DateTime?> valOf) {
    _listOfDate = valOf;
    notifyListeners();
  }

  // start and end  date
  String? _startDate;
  String? _endDate;
  String? get startDate => _startDate;
  String? get endDate => _endDate;

  void updateStartDate(String valOf) {
    _startDate = valOf;
    notifyListeners();
  }

  void updateEndDATE(String valLOf) {
    _endDate = valLOf;
    notifyListeners();
  }

  // list of secction from api all record for fillter
  final List<String> _lisOfTitleCat = ['Select a section'];
  List<String> get lisOfTitleCat => _lisOfTitleCat;

  final List<int> _lisOfIdCat = [0];
  List<int> get lisOfIdCat => _lisOfIdCat;

  String? _changeVal;
  String? get valChange => _changeVal;

  void addTOListTiltleCat(String valOf) {
    _lisOfTitleCat.add(valOf);
    notifyListeners();
  }

  void addToListIdCat(int valOf) {
    _lisOfIdCat.add(valOf);
    notifyListeners();
  }

  void clearListTitleCat() {
    _lisOfTitleCat.clear();
    notifyListeners();
  }

  void clearListIdCat() {
    _lisOfIdCat.clear();
    notifyListeners();
  }

  void updatechangeVal(String valOf) {
    _changeVal = valOf;
    notifyListeners();
  }

  // this methods for api/call-record/attendreport/=> reportBilling
  AdminAttendreport _attendreport = AdminAttendreport();
  AdminAttendreport get attendreport => _attendreport;

  final List<UsersAttends> _listUsersAttends = [];
  List<UsersAttends> get listUsersAttends => _listUsersAttends;

  void addAdminAttendreport(AdminAttendreport attendreport) {
    _attendreport = attendreport;
    notifyListeners();
  }

  void addUsersAttendreport(UsersAttends listOfUserAttend) {
    _listUsersAttends.add(listOfUserAttend);
    notifyListeners();
  }

  void clearListOfUserAttend() {
    _listUsersAttends.clear();
    notifyListeners();
  }

// this method  for api call-record/commision
  final List<CommsionsEndOfResult> _commsionsEndOfResult = [];
  List<CommsionsEndOfResult> get commsionsEndOfResult => _commsionsEndOfResult;

  void addToListCommsionsEndOfResult(CommsionsEndOfResult valOf) {
    _commsionsEndOfResult.add(valOf);
    notifyListeners();
  }

  void clearListOfCommsionsEndOfResult() {
    _commsionsEndOfResult.clear();
    notifyListeners();
  }

// this method for api call-record/effort
  final List<AgentsEffort> _listAgentsEffort = [];
  List<AgentsEffort> get listAgentsEffort => _listAgentsEffort;

  void addToListAdminEffort(AgentsEffort agentsEffort) {
    _listAgentsEffort.add(agentsEffort);
    notifyListeners();
  }

  void clearListAdminEffort() {
    _listAgentsEffort.clear();
    notifyListeners();
  }
}
