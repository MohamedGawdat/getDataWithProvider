import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

saveImageToGallery(String url) async {


// You can request multiple permissions at once.
  Map<Permission, PermissionStatus> statuses = await [
    // Permission.location,
    Permission.storage,
  ].request();
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