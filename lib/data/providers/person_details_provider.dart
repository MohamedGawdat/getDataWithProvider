import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ibtikar_test/constants/constants.dart';
import 'package:ibtikar_test/data/models/person/person_gallery.dart';
import 'package:ibtikar_test/data/network/ApiManager.dart';
import 'package:ibtikar_test/data/network/ApiResponse.dart';

class PersonDetailsProvider extends ChangeNotifier {
  List<ProfileGallery> profileGallery = [];

  fetchPersonImages(int id) async {
    EasyLoading.show(status: 'loading...');

    ApiResponse response = await ApiManager.sendRequest(
        link: "person/${id.toString()}/images?api_key=${AppConst.apiAuthKey}",
        method: Method.GET);
    EasyLoading.dismiss();

    if (response.isSuccess) {
      PersonGallery personGallery =
          PersonGallery.fromJson(response.data as Map<String, dynamic>);
      profileGallery = personGallery.profiles;
    }

    notifyListeners();
  }
}
