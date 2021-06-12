import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:ibtikar_test/constants.dart';
import 'package:ibtikar_test/data/models/person/people_model.dart';
import 'package:ibtikar_test/data/network/ApiManager.dart';
import 'package:ibtikar_test/data/network/ApiResponse.dart';
import 'package:ibtikar_test/utilities/connictivity.dart';

class HomeScreenProvider extends ChangeNotifier {
  late int totalPages;
  int currentPage = 1;
  bool hasNetwork = true;
  List<PopularPersonResults> peopleResults = [];
  late PeopleApiResponse personApiResponse;
  // late PersonApiResponse personApiResponse ;
  getPopularPersonsList() async {
    var box = await Hive.openBox('peopleFirstPageBox');

    hasNetwork= await checkInternetConnection();
if (!hasNetwork){

  var cacheJsonEncode= jsonEncode(box.get('personsPage1'));
  personApiResponse =
  PeopleApiResponse.fromJson(jsonDecode(cacheJsonEncode) as Map<String, dynamic>);
   peopleResults =  personApiResponse.results;

}
else{
  if (currentPage == 1) EasyLoading.show(status: 'loading...');

  ApiResponse response = await ApiManager.sendRequest(
      link:
      "person/popular?api_key=${AppConst.apiAuthKey}&page=${currentPage.toString()}",
      method: Method.GET);

  if (response.isSuccess) {
     personApiResponse =
    PeopleApiResponse.fromJson(response.data as Map<String, dynamic>);
    box.put('personsPage1', response.data as Map<String, dynamic>);

    totalPages = personApiResponse.totalPages;
    currentPage = personApiResponse.page;

    peopleResults = peopleResults + personApiResponse.results;
  }
  if (currentPage == 1) EasyLoading.dismiss();
}

    notifyListeners();
  }

  getNextPage() {
    if (currentPage < totalPages) {
      currentPage++;
      getPopularPersonsList();
    }
  }

  resetData() {
    peopleResults = [];
    currentPage = 1;
    getPopularPersonsList();
  }
}
