import 'package:flutter/material.dart';
import 'package:news_app/shared/shared.dart';

class CardNews extends StatelessWidget {
  const CardNews({
    Key? key,
    required this.image,
    required this.title,
    required this.author,
    required this.date,
  }) : super(key: key);

  final String image;
  final String title;
  final String author;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CustomBoxDecoration.allBorderGrey350,
      margin: const EdgeInsets.only(bottom: 16),
      child: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            child: MyImageNetwork(
              image: image,
              fit: BoxFit.cover,
              width: getWidth(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: CustomTextStyle.headerBlackBold16,
                ),
                const SizedBox(height: 16),
                Text(
                  author,
                  style: CustomTextStyle.captionBlack12,
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: CustomTextStyle.captionGrey12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
