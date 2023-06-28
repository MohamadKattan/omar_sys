import 'package:flutter/foundation.dart';
import '../../../services/databasehelper.dart';
import '../models/order_models.dart';
import '../models/user_model.dart';
import '../services/api_links.dart';

OrdersController orders = OrdersController();

class OrdersController {

  User? user;
  // var data;
  List<OrderModel>? orders;

  bool isLoading = true;
  bool hasErr = false;


  getHome() async {

    try {
      hasErr =  false;

      final apiResponse = await databaseHelper.getData(ordersURL);
   
      orders =  (apiResponse.data['attenda'] as List).map((e) => OrderModel.fromJSON(e)).toList();
      // sections = apiRecordsList;
      // user = User.fromJSON(apiResponse.data['arr']['user']);
      // data = apiResponse.data ;

      isLoading = false;
      //
    } catch (e) {
      hasErr =  true;
      if (kDebugMode) {
        print(e);

      }

    }
  }
}


