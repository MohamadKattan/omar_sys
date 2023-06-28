import 'package:flutter/foundation.dart';
import '../models/call_records_models.dart';
import '../../../services/databasehelper.dart';
import '../models/user_model.dart';


DataController recordsData = DataController();

class DataController {
  List<CallRecordModels> callRecords = [];

  User? user;
  // ignore: prefer_typing_uninitialized_variables
  var data;

  bool isLoading = true;
  bool hasErr = false;
  String nextUrl = '';
  bool hasNext = false;
  int thisPage = 1;
  int lastPage = 1;



  // for filter

  String? name = '';
  String? nameType = 'name';
  String? customerStatus = '';
  String? phoneStatus = '';
  String? finalStatus = '';
  List<String> nameTypeList = <String>['name', 'phone', 'email', 'city'];
  List<String> customerStatusList = <String>['','Blanks', 'wrong number', 'interested', 'pending','changed his mind'];
  List<String> phoneStatusList = <String>['','Blanks', 'not reached', 'answer', 'closed'];
  List<String> finalStatusList = <String>['','Blanks', 'reserved', 'pending approval', 'don\'t call again','database'];

  late String? filterUrl = 'customer_status=$customerStatus&phone_status=$phoneStatus&final_results=$finalStatus&$nameType=$name';


  getData(url , bool first) async {

    try {

      if(first){
        callRecords.clear();
        isLoading =  true;
      }
      hasErr =  false;


      final apiResponse = await databaseHelper.getData(url);
  
      var apiRecordsList =  (apiResponse.data['callRecord']['data'] as List).map((e) => CallRecordModels.fromJSON(e)).toList();
      // callRecords = apiRecordsList;
      callRecords.addAll(apiRecordsList);
      // user = User.fromJSON(apiResponse.data['arr']['user']);
      data = apiResponse.data ;
      thisPage = apiResponse.data['callRecord']['current_page'] ;
      lastPage = apiResponse.data['callRecord']['last_page']  ;

      isLoading = false;
      //
    } catch (e) {
      hasErr =  true;
      isLoading = false;

      if (kDebugMode) {
        print(e);

      }

    }
  }
}


