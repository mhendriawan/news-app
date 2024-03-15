import 'package:flutter/material.dart';

import '../../shared.dart';

class CustomBoxDecoration {
  static final BoxDecoration allBorderGrey = BoxDecoration(
    color: ColorPalettes.grey,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: ColorPalettes.grey),
  );

  static final BoxDecoration allBorderGrey350 = BoxDecoration(
    color: ColorPalettes.grey350,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: ColorPalettes.grey350),
  );

  static const BoxDecoration topBorderGrey350 = BoxDecoration(
    color: ColorPalettes.grey350,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
  );

  static final BoxDecoration boxGrey350 = BoxDecoration(
    color: ColorPalettes.grey350,
    borderRadius: BorderRadius.circular(20),
  );
}
