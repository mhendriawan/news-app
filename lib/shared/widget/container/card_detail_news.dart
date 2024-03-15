import 'package:flutter/material.dart';

import '../../shared.dart';

class CardDetailNews extends StatelessWidget {
  const CardDetailNews({
    Key? key,
    required this.image,
    required this.title,
    required this.sourceLink,
    required this.author,
    required this.date,
    required this.description,
  }) : super(key: key);

  final String image;
  final String title;
  final String sourceLink;
  final String author;
  final String date;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CustomBoxDecoration.topBorderGrey350,
      height: getHeight(context) * 0.6,
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
      child: Column(
        children: [
          const LinePopup(),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: CustomTextStyle.headerBlackBold18,
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
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                child: MyImageNetwork(
                  fit: BoxFit.cover,
                  width: getWidth(context),
                  image: image,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                description,
                style: CustomTextStyle.bodyBlack14,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomWebView(
                          url: sourceLink,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Read More",
                    style: CustomTextStyle.captionBlue12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
