import 'package:flutter/cupertino.dart';
import 'package:ibtikar_test/data/models/person/people_model.dart';
import 'package:ibtikar_test/data/providers/PeopleManager.dart';

class HomeScreenProvider extends ChangeNotifier {
  List<PopularPersonResults> peopleResults = [];
  PeopleManager peopleManager = PeopleManager();
  getPopularPersonsList() async {
    peopleResults = await peopleManager.getPeople();

    notifyListeners();
  }

  fetchNextPage() async {
    peopleResults = await peopleManager.getNextPage();
    notifyListeners();
  }

  resetPeopleList() async {
    peopleResults = await peopleManager.resetPeopleList();

    notifyListeners();
  }
}
