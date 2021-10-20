import 'package:flutter/material.dart';
import 'package:wallpaper/main.dart';
import 'package:wallpaper/shared/custom-widgets/custom-text.dart';

Future<void> customAlert(String text, String title) async {
  return showDialog(
    context: navigatorKey.currentContext!,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: CustomText(text: title,),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              CustomText(text: text,)
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}