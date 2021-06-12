import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

saveImageToGallery(String url) async {
  EasyLoading.show(status: 'Downloading...');

  var response = await Dio().get(
      url,
      options: Options(responseType: ResponseType.bytes));
  final result = await ImageGallerySaver.saveImage(
      Uint8List.fromList(response.data),
      quality: 60,
      name: "hello");
  if(result['isSuccess']==true)
  EasyLoading.showSuccess('Done');
  else
    EasyLoading.showError('Error');


  EasyLoading.dismiss();

}