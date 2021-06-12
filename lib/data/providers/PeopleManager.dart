import 'dart:async';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ibtikar_test/data/cache/app_cache.dart';
import 'package:ibtikar_test/data/cache/cache_util.dart';
import 'package:ibtikar_test/data/models/person/people_model.dart';
import 'package:ibtikar_test/data/network/ApiManager.dart';
import 'package:ibtikar_test/data/network/ApiResponse.dart';
import 'package:ibtikar_test/utilities/connictivity.dart';
import 'package:ibtikar_test/utilities/toast.dart';
import '../../constants/constants.dart';

class PeopleManager {
  static int totalPages = 0;
  static int currentPage = 1;
  late PeopleApiResponse peopleApiResponse;
  static List<PopularPersonResults> peopleResults = [];

  Future<List<PopularPersonResults>> getPeople() async {
    if (await checkInternetConnection()) {
      return _getPeopleFromNetwork();
    } else
      return _getCachedPeople();
  }

  Future<List<PopularPersonResults>> getNextPage() async {
    if (await checkInternetConnection()) {
      return _getPeopleNextPage();
    } else
      return peopleResults;
  }

  Future<List<PopularPersonResults>> resetPeopleList() async {
    if (await checkInternetConnection()) {
      return _resetPeopleList();
    } else
      return _getCachedPeople();
  }

  _getCachedPeople() async {
    peopleResults = await AppCache.getPeopleListFromCache();
    return peopleResults;
  }

  FutureOr<List<PopularPersonResults>> _getPeopleFromNetwork() async {
    EasyLoading.show(status: 'loading...');

    peopleResults = await loadDataFromApi();

    EasyLoading.dismiss();

    return peopleResults;
  }

  FutureOr<List<PopularPersonResults>> _getPeopleNextPage() async {
    if (currentPage < totalPages) {
      currentPage++;
      peopleApiResponse.results = await loadDataFromApi();
      peopleResults = peopleResults + peopleApiResponse.results;
    } else {
      showToastError(msg: 'You Had Reach The Last Page');
    }

    return peopleResults;
  }

  FutureOr<List<PopularPersonResults>> _resetPeopleList() async {
    currentPage = 1;
    peopleResults = [];
    peopleApiResponse.results = await loadDataFromApi();
    showToastSuccess(msg: 'Refresh');
    return peopleApiResponse.results;
  }

  Future<List<PopularPersonResults>> loadDataFromApi() async {
    ApiResponse response = await ApiManager.sendRequest(
        link:
            "person/popular?api_key=${AppConst.apiAuthKey}&page=${currentPage.toString()}",
        method: Method.GET);

    if (response.isSuccess) {
      peopleApiResponse =
          PeopleApiResponse.fromJson(response.data as Map<String, dynamic>);
      if (currentPage == 1) CacheUtil.save('personsPage1', response.data);

      totalPages = peopleApiResponse.totalPages;
      currentPage = peopleApiResponse.page;
      return peopleApiResponse.results;
    } else {
      EasyLoading.showError('Connection Error');

      return [];
    }
  }
}
