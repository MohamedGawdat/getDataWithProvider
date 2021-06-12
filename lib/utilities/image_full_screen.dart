import 'package:flutter/material.dart';
import 'package:ibtikar_test/constants.dart';
import 'package:ibtikar_test/utilities/save_image_to_gallery.dart';
import 'package:photo_view/photo_view.dart';

class ImageFullScreen extends StatelessWidget {
  final String url;
  const ImageFullScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(icon:Icon(Icons.download),onPressed: ()=>saveImageToGallery(url),),
            AppConst.sizedBoxW10,
            // AppConst.sizedBoxW5,
          ],
        ),
        body: PhotoView(imageProvider: NetworkImage(url)));
  }
}
