import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ibtikar_test/style/app_colours.dart';
import 'package:ibtikar_test/utilities/images_handler/image_full_screen.dart';
import 'package:ibtikar_test/utilities/navigation.dart';
import 'package:photo_view/photo_view.dart';
import 'package:shimmer/shimmer.dart';

class ImageView extends StatelessWidget {
  final String url;
  final double width,height;
  final bool downloadableImg;
  const ImageView({Key? key,required this.url,required this.width, required this.height, this.downloadableImg=false}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: downloadableImg?(){
        NavigateUtil.navigate(context, ImageFullScreen(url: this.url));
      }:null,
        child: buildCachedNetworkImage());
  }

  CachedNetworkImage buildCachedNetworkImage() {
    return CachedNetworkImage(
    imageUrl: url,
    placeholder: (context, url) =>   Shimmer.fromColors(
      baseColor: AppColors.Sec_Color,
      highlightColor: AppColors.Sec_Color2,
      child: SizedBox(
        width: this.width,
        height: this.height,
      ),
    ),
    errorWidget: (context, url, error) => Icon(Icons.error),
    width: this.width,
    height: this.height,
    fit: BoxFit.fill,
    );
  }

}
