
import 'package:flutter/material.dart';

import '../../app_info.dart';
import '../../size_config.dart';

class StatusWidget extends StatelessWidget {
  final Color color ;
  final Color textColor ;
  final String status;
  const StatusWidget({Key? key, required this.color, required this.status, required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,

        borderRadius:  BorderRadius.only(
            topLeft: Radius.circular($borderRadius.toDouble()),
            topRight: Radius.circular($borderRadius.toDouble()),
            bottomLeft: Radius.circular($borderRadius.toDouble()),
            bottomRight: Radius.circular($borderRadius.toDouble())
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0,right: 12,top: 8,bottom:5 ),
        child: Center(
          child: Text(status,
            style:TextStyle(fontSize:screenWidthDivided(28, context),color: textColor ),),
        ),
      ),
    );
  }
}
class StatusWithIconsWidget extends StatelessWidget {
  final Color color ;
  final Color textColor ;
  final String status;
  final IconData icon;
  const StatusWithIconsWidget({Key? key, required this.color, required this.status, required this.textColor, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,

        borderRadius:  BorderRadius.only(
            topLeft: Radius.circular($borderRadius.toDouble()),
            topRight: Radius.circular($borderRadius.toDouble()),
            bottomLeft: Radius.circular($borderRadius.toDouble()),
            bottomRight: Radius.circular($borderRadius.toDouble())
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0,right: 12,top: 5,bottom:5 ),
        child: Row(
          children: [
            Icon(icon,color: textColor,size:screenWidthDivided(28, context) ,),
           const SizedBox(width: 5,),
            Text(status,
              style:TextStyle(fontSize:screenWidthDivided(28, context),color: textColor ),),
          ],
        ),
      ),
    );
  }
}

