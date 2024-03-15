import 'package:flutter/material.dart';
import 'package:news_app/shared/shared.dart';

class LinePopup extends StatelessWidget {
  const LinePopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      width: 50,
      decoration: CustomBoxDecoration.allBorderGrey,
    );
  }
}
