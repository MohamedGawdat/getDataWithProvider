import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ibtikar_test/constants.dart';
import 'package:ibtikar_test/data/models/person/person_module.dart';
import 'package:ibtikar_test/data/network/ApiManager.dart';
import 'package:ibtikar_test/data/network/ApiResponse.dart';

class HomeScreenProvider extends ChangeNotifier {
  late int totalPages;
  int currentPage = 1;

  List<PopularPeopleResults> peopleResults = [];
  // late PersonApiResponse personApiResponse ;
  getPopularPersonsList() async {
    EasyLoading.show(status: 'loading...');

    ApiResponse response = await ApiManager.sendRequest(
        link:
            "person/popular?api_key=${AppConst.apiAuthKey}&page=${currentPage.toString()}",
        method: Method.GET);
    EasyLoading.dismiss();

    if (response.isSuccess) {
      PersonApiResponse personApiResponse =
          PersonApiResponse.fromJson(response.data as Map<String, dynamic>);
      totalPages = personApiResponse.totalPages;
      currentPage = personApiResponse.page;

      peopleResults = peopleResults+personApiResponse.results;
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
    currentPage = 0;
    getPopularPersonsList();
  }
}
