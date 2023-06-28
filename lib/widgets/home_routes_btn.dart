import 'package:flutter/material.dart';
import 'package:omar_system/app_info.dart';
import '../size_config.dart';


class HomeRoutesBtn extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final VoidCallback? func;
  const HomeRoutesBtn({Key? key, this.icon, this.title, this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: GestureDetector(
        onTap: func,
        child: Container(
          margin: EdgeInsets.only(
              top: screenHeightMultiply(0.01, context),
              bottom: screenHeightMultiply(0.01, context),
              right: screenHeightMultiply(0.01, context),
              left: screenHeightMultiply(0.01, context)),
          // width: screenWidthMultiply(1, context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular($borderRadius.toDouble()/2),
            color: checkDarkTheme(context.m) ? Colors.black : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(
                child: Padding(
                  padding:
                  const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:  [
                      Icon(icon,color: Colors.orangeAccent,),
                      const SizedBox(width: 10,),
                      Text(title!)
                    ],
                  ),
                )),
          ),

      ),
    );
  }
}
