import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, String error) {
  // set up the button
  // Widget okButton = FlatButton(
  //   child: Text("OK"),
  //   onPressed: () { },
  // );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Icon(
          Icons.block,
          size: 50,
          color: Colors.red,
        ),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 200,
          child: Text(
            error, textAlign: TextAlign.center,
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              height: 1.4,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    ),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))),
    actions: const [
      // okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


showAlertDialogWithIcon(
    BuildContext context, String error, IconData icon, Color color) {
  // set up the button
  // Widget okButton = FlatButton(
  //   child: Text("OK"),
  //   onPressed: () { },
  // );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    // title: Text("My title"),
    content:
    // Text("$error",textAlign: TextAlign.center,),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 50,
          color: color,
        ),
        const SizedBox(width: 5),
        SizedBox(
          width: 200,
          child: Text(
            error, textAlign: TextAlign.center,
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              height: 1.4,
              fontSize: 14,
              // fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    ),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))),
    actions:const  [ ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
