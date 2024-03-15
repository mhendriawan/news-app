import 'package:flutter/material.dart';
import 'package:news_app/shared/shared.dart';

Future<void> failedAlert(BuildContext context, String title) async {
  return showDialog(
    context: context,
    builder: (BuildContext builderContext) {
      AlertDialog dialog = AlertDialog(
        backgroundColor: ColorPalettes.grey350,
        title: const Icon(
          Icons.info_outline,
          color: ColorPalettes.darkPrimary,
          size: 40,
        ),
        content: Text(
          title,
          style: CustomTextStyle.bodyBlack14,
          textAlign: TextAlign.center,
        ),
      );

      Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(builderContext).pop();
      });

      return dialog;
    },
  );
}
