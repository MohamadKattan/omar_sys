import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:omar_system/models/admin_attendreport.dart';
import 'package:omar_system/models/admin_effortreport.dart';
import 'package:omar_system/models/admin_report.dart';
import 'package:omar_system/services/provider.dart';
import 'package:omar_system/views/admin_page/componen/date_fillter.dart';
import 'package:provider/provider.dart';
import '../app_info.dart';
import '../models/admin_commision.dart';
import 'local_database.dart';
import 'api_links.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

DatabaseHelper databaseHelper = DatabaseHelper();

class DatabaseHelper {
  var dio = Dio();
  int connectTimeout = 30000;

  // ----------------- Headers -----------------//

  getHeaders() {
    Map<String, String> header = {
      'Accept': 'application/json',
      "Content-Type": 'application/json',
      'Authorization': 'Bearer ${dataBase.getToken ?? ''}',
      'x-api-key': $apiPassword,
    };
    return header;
  }

  // ----------------- Get Data From Api -----------------//

  getData(url) async {
    dio.options
      // ..baseUrl = url
      ..connectTimeout = connectTimeout
      ..receiveTimeout = connectTimeout
      ..validateStatus = (int? status) {
        return status != null && status > 0;
      }
      ..headers = getHeaders();

    final response = await dio.get(url);

    return response;
  }

  // ----------------- Post Data to Api -----------------//

  postData(url, data) async {
    dio.options
      // ..baseUrl = url
      ..connectTimeout = connectTimeout
      ..receiveTimeout = connectTimeout
      ..validateStatus = (int? status) {
        return status != null && status > 0;
      }
      ..headers = getHeaders();
    var apiResponse = await dio.post(
      url,
      data: data,
      onSendProgress: (int sent, int total) {},
    );

    return apiResponse;
  }

// ----------------- login -----------------//

  loginData(String email, String password, String deviceName) async {
    // dio.options
    //   ..connectTimeout = connectTimeout
    //   ..receiveTimeout = connectTimeout
    //   ..validateStatus = (int? status) {
    //     return status != null && status > 0;
    //   }
    //   ..headers = {
    //     'Accept': 'application/json',
    //     'x-api-key': $apiPassword,
    //   };
    // var apiResponse = await dio.post(
    //   loginURL,
    //   data: {"email": email, "password": password, "device_name": deviceName},
    // );
    // if (apiResponse.data["status"] == false) {
    //   if (kDebugMode) {
    //     print(apiResponse.data);
    //   }
    // } else {
    //   dataBase.saveToken = apiResponse.data["data"]["access_token"];
    //   if (apiResponse.data["data"]["user"]['roles'] != null) {
    //     final adminName = apiResponse.data["data"]["user"]['roles']['name'];
    //     print('admin is :: $adminName ');
    //   }
    // }
    // return apiResponse;
    bool isresponseOk = false;
    Map<String, String> headerLogIn = {
      'Accept': 'application/json',
      'x-api-key': $apiPassword,
    };
    Map<String, dynamic> bodyLoging = {
      "email": email,
      "password": password,
      "device_name": deviceName
    };
    try {
      var url = Uri.parse(loginURL);
      var response =
          await http.post(url, headers: headerLogIn, body: bodyLoging);
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["status"] == false) {
        isresponseOk = false;
        if (kDebugMode) {
          print((jsonResponse)["status"]);
        }
      } else {
        isresponseOk = true;
        dataBase.saveToken = jsonResponse["data"]["access_token"];
        if (jsonResponse["data"]["user"]['roles'] != null) {
          final adminName = jsonResponse["data"]["user"]['roles'][0]['name'];
          if (adminName == "team_leader" || adminName == "admin") {
            dataBase.saveAccseseAdmin = 'admin';
            riverpod.read(adminState.notifier).state = 'admin';
          }
        }
      }
    } catch (ex) {
      // isresponseOk = false;
      errorMessgae('catch error logIn :: ${ex.toString()}');
      if (kDebugMode) {
        print('error post login to data base $ex');
      }
    }
    return isresponseOk;
  }

// ----------------- Register -----------------//

  registerData(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String phone,
      String fcmToken,
      String lang) async {
    dio.options
      // ..baseUrl = loginURL
      ..connectTimeout = connectTimeout
      ..receiveTimeout = connectTimeout
      ..validateStatus = (int? status) {
        return status != null && status > 0;
      }
      ..headers = getHeaders();
    var apiResponse = await dio.post(
      registerURL,
      data: {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "phone": phone,
        "fcm_id": fcmToken,
        "lang": lang,
        "user_type": 'student',
      },
    );
    return apiResponse;
  }

// ----------------- logout -----------------//
  logOut() async {
    dio.options
      // ..baseUrl = loginURL
      ..connectTimeout = connectTimeout
      ..receiveTimeout = connectTimeout
      ..validateStatus = (int? status) {
        return status != null && status > 0;
      }
      ..headers = getHeaders();
    var apiResponse = await dio.post(
      logoutURL,
    );
    bool status;

    if (apiResponse.data["status"] == false) {
      // print("noTok");
      status = true;
    } else {
      localDataBase.delete('token');
      localDataBase.delete('admin');
      status = false;
    }

    return status;
  }

  // ==============admin call-record/report ======================

  // this method for get data from  Call Record Report api
  Future adminCallRecordReport(BuildContext context,
      {required bool isFiltter,
      String? startAt,
      String? endAt,
      int? catId}) async {
    final valLisner = context.read<ProviderListiner>();
    valLisner.cleanListOfAgents();
    String? postUrl;
    try {
      if (isFiltter) {
        postUrl =
            '$adminReportUrl?created_at[start]=$startAt&created_at[end]=$endAt&cat_call_record_id=$catId';
      } else {
        postUrl = adminReportUrl;
      }
      var url = Uri.parse(postUrl);
      var response = await http.get(url, headers: getHeaders());
      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;

        AllReportInfo allReportInfo = AllReportInfo.fromJson(jsonResponse);
        if (context.mounted) {
          valLisner.addAllReportInfo(allReportInfo);
          if (allReportInfo.catCallRecord != null) {
            if (valLisner.lisOfTitleCat.length <= 1) {
              for (var i in allReportInfo.catCallRecord!) {
                valLisner.addTOListTiltleCat('${i.title}');
                valLisner.addToListIdCat(i.id ?? 55);
              }
            }
          }
        }
        Map<String, dynamic> usersWorkInfo =
            allReportInfo.users as Map<String, dynamic>;
        usersWorkInfo.forEach(
          (key, value) {
            final result = AgentAdminReport.fromJson(value);
            valLisner.addAgentToList(result);
          },
        );
      }
    } catch (ex) {
      if (kDebugMode) {
        print('error  admin get report $ex');
      }
    }
  }

// this method for get data from  billing report api
  Future adminAttendReport(BuildContext context) async {
    final valLisner = context.read<ProviderListiner>();
    valLisner.clearListOfUserAttend();
    try {
      var url = Uri.parse(adminAttimndUrl);
      var response = await http.get(url, headers: getHeaders());
      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        AdminAttendreport adminAttendreport =
            AdminAttendreport.fromJson(jsonResponse);
        valLisner.addAdminAttendreport(adminAttendreport);
        adminAttendreport.users?.forEach((key, value) {
          UsersAttends users = UsersAttends.fromJson(value);
          valLisner.addUsersAttendreport(users);
        });
      }
    } catch (ex) {
      if (kDebugMode) {
        print('error admin Attendreport :::$ex ');
      }
    }
  }

// this method for get data from commision api
  Future adminCommisionReport(BuildContext context) async {
    final valLisner = context.read<ProviderListiner>();
    valLisner.clearListOfCommsionsEndOfResult();
    List<AdminCommisison> checkList = [];
    List<CommsionsEndOfResult> newList = [];
    newList.clear();
    int indexAgentsInfo = 0;
    try {
      //  got data and convert in object AdminCommisison
      var url = Uri.parse(adminCommisionurl);
      var response = await http.get(url, headers: getHeaders());
      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        AdminCommisison adminCommisison =
            AdminCommisison.fromJson(jsonResponse);
        checkList.add(adminCommisison);
        /* create a map to make reletion between val what i 
        need from api *(api doublected val too much and no ralted table)*/
        checkList[0].agentsInfo?.forEach(
          (e) {
            Map<String, dynamic> map = {
              "id": e.agentId,
              "name": e.name,
              "count": 0,
              "countR": 0,
              "commsionsPending": "0",
              "priceCurrentMonth": "0"
            };
            CommsionsEndOfResult commsionsEndOfResult =
                CommsionsEndOfResult.fromMap(map);
            newList.add(commsionsEndOfResult);
            indexAgentsInfo++;
            if (indexAgentsInfo == checkList[0].agentsInfo?.length) {
              // filtter and add countPayment
              int indexCountPayment = 0;
              for (var i in checkList[0].countPayment!) {
                int index1 =
                    newList.indexWhere((element) => element.id == i.userId);
                newList[index1].totleCount = i.count;
                newList[index1].remainingCount = i.countR;
                indexCountPayment++;
                if (indexCountPayment == checkList[0].countPayment?.length) {
                  // filtter and add commsionsPending
                  int indexCPending = 0;
                  for (var x in checkList[0].commsionsPending!) {
                    int index2 =
                        newList.indexWhere((element) => element.id == x.userId);
                    newList[index2].expextedcommision = x.price;
                    indexCPending++;
                    if (indexCPending ==
                        checkList[0].commsionsPending?.length) {
                      // fillter and add commsions
                      int indexCommsions = 0;
                      for (var z in checkList[0].commision!) {
                        int index3 = newList
                            .indexWhere((element) => element.id == z.userId);
                        newList[index3].commisionMonth = z.priceCurrentMonth;
                        indexCommsions++;
                        if (indexCommsions == checkList[0].commision?.length) {
                          // end of result add an object to provider list of object type
                          for (var endResult in newList) {
                            valLisner.addToListCommsionsEndOfResult(endResult);
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          },
        );
      }
    } catch (ex) {
      if (kDebugMode) {
        print('error admin Commision Report:::$ex');
      }
    }
  }

//this method for get data from effort api
  Future adminEffortReport(BuildContext context) async {
    final valLisner = context.read<ProviderListiner>();
    valLisner.clearListAdminEffort();
    try {
      var url = Uri.parse(adminEffortUrl);
      var response = await http.get(url, headers: getHeaders());
      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        AdminEffortReport adminEffortReport =
            AdminEffortReport.fromJson(jsonResponse);
            adminEffortReport.listAgentsEffort?.forEach((ele) {
               valLisner.addToListAdminEffort(ele);
            });
      }
    } catch (ex) {
      if (kDebugMode) {
        print('Error Admin Effort Report ::$ex');
      }
    }
  }
}
