import 'dart:convert';
import 'package:ibtikar_test/data/models/person/people_model.dart';
import 'cache_util.dart';

class AppCache {

  static void saveCache(var json) {
    CacheUtil.save("personsPage1", json);
  }

  static void clearCache() {
    CacheUtil.clearCache();
  }

  static Future<List<PopularPersonResults>> getPeopleListFromCache() async{
     var peopleData =await CacheUtil.get("personsPage1",);
    PeopleApiResponse personApiResponse =
        PeopleApiResponse.fromJson(jsonDecode(jsonEncode(peopleData)) as Map<String, dynamic>);
     return  personApiResponse.results;
  }
}
