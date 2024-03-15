import 'package:flutter/material.dart';
import 'package:news_app/shared/common/common.dart';

class SimpleLoadingWidget extends StatelessWidget {
  const SimpleLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorPalettes.lightPrimary,
      ),
    );
  }
}
