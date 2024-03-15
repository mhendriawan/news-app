import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyImageNetwork extends StatelessWidget {
  const MyImageNetwork({
    required this.image,
    this.fit,
    this.height = 200,
    this.width = 200,
    Key? key,
  }) : super(key: key);

  final String image;
  final BoxFit? fit;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      fit: fit,
      height: height,
      width: width,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Center(
        child: Image.asset(
          'assets/images/img_broken_img.png',
          fit: BoxFit.fill,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
