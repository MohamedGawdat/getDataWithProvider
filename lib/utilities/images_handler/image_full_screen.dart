import 'package:flutter/material.dart';
import 'package:ibtikar_test/utilities/images_handler/save_image_to_gallery.dart';
import 'package:ibtikar_test/widgets/sized_boxes.dart';
import 'package:photo_view/photo_view.dart';

class ImageFullScreen extends StatelessWidget {
  final String url;
  const ImageFullScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.download),
              onPressed: () => saveImageToGallery(url),
            ),
            SizedBoxConst.sizedBoxW10,
            // AppConst.sizedBoxW5,
          ],
        ),
        body:
            Hero(tag: url, child: PhotoView(imageProvider: NetworkImage(url))));
  }
}
