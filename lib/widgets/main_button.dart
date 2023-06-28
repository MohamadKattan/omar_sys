import 'package:flutter/material.dart';
import '../app_info.dart';
import '../size_config.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Color btnColor,fontColor;
  final VoidCallback  function;
  final IconData?  icon;
  const MainButton(
      {Key? key,
      required this.text,
      required this.function, required this.btnColor, required this.fontColor, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Container(
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius:
              BorderRadius.all(Radius.circular($borderRadius.toDouble())),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidthDivided(5, context),
            right: screenWidthDivided(5, context),
            top: screenWidthDivided(30, context),
            bottom: screenWidthDivided(30, context),
          ),
          child: icon != null ? Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                  Icon(icon,color: Colors.white,),

                  SizedBox(
                    width:screenWidthDivided(25, context) ,
                  ),
                Text(
                  text,
                    textAlign : TextAlign.center,
                  style: TextStyle(

                      color: fontColor, fontSize: screenWidthDivided(26, context)),
                ),
              ],
            ),
          ) :Text(
            text,
            textAlign : TextAlign.center,
            style: TextStyle(

                color: fontColor, fontSize: screenWidthDivided(26, context)),
          ),
        ),
      ),
    );
  }
}
