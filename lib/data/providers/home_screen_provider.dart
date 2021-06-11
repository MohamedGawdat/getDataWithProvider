import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ibtikar_test/constants.dart';
import 'package:ibtikar_test/data/models/person/person_module.dart';
import 'package:ibtikar_test/data/network/ApiManager.dart';
import 'package:ibtikar_test/data/network/ApiResponse.dart';

class HomeScreenProvider extends ChangeNotifier {
  List<PopularPeopleResults> peopleResults=[];
 // late PersonApiResponse personApiResponse ;
  getPopularPersonsList(
      { required int page}) async {

    EasyLoading.show(status: 'loading...');


    ApiResponse response = await ApiManager.sendRequest(
      link: "person/popular?api_key=${AppConst.apiAuthKey}&page=${page.toString()}",
      method: Method.GET
    );
    EasyLoading.dismiss();

    if ( response.isSuccess) {
      PersonApiResponse personApiResponse = PersonApiResponse.fromJson(response.data as Map<String, dynamic> );
      peopleResults=personApiResponse.results;

    }


    notifyListeners();
  }


}
