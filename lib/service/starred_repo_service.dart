import 'dart:convert';
import 'package:trending_page_app/state/models/trendingRepoModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<TrendingRepo>>? fetchStarredRepo(Function? errorCallback) async {
  try {
    dynamic res = await fetchFromLocalStorage();
    if (res != null && res.length > 0) {
      return res;
    } else {
      return [];
    }
  } catch (e) {
    errorCallback!();
  }
  return [];
}

Future<List<TrendingRepo>>? addStarredRepo(
    TrendingRepo repo, Function? errorCallback) async {
  print("Adding Repo to Starred List");
  try {
    dynamic res = await fetchFromLocalStorage();
    if (res != null && res.length > 0) {
      res.add(repo);
      storeToLocalStorage(res);
      return res;
    } else {
      storeToLocalStorage([repo]);
      return [repo];
    }
  } catch (e) {
    errorCallback!();
  }
  return [];
}

Future<List<TrendingRepo>>? removeStarredRepo(
    TrendingRepo repo, Function? errorCallback) async {
  print("Removing Repo from Starred List");
  try {
    List<TrendingRepo>? res = await fetchFromLocalStorage();
    print("Befor Removing ${res.length}");
    if (res != null && res.length > 0) {
      res = removeMatch(res, repo.rank!);
      print("After Removing ${res.length}");
      storeToLocalStorage(res);
      return res;
    } else {
      storeToLocalStorage([]);
      return [];
    }
  } catch (e) {
    print(e);
    errorCallback!();
  }
  return [];
}

Future<List<TrendingRepo>> fetchFromLocalStorage() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? starredRepoString = prefs.getString('starredRepo');
  if (starredRepoString != null) {
    print('Fetched Starred Repos From Local Storage');
    return decodeTrendingRepo(starredRepoString);
  }
  return [];
}

Future<void> storeToLocalStorage(response) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool result = await prefs.setString('starredRepo', jsonEncode(response));
  print(result);
  print('Stored Starred Repos to Local Storage');
}

List<TrendingRepo> decodeTrendingRepo(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<TrendingRepo>((json) => TrendingRepo.fromJson(json))
      .toList();
}

List<TrendingRepo> removeMatch(List<TrendingRepo> starredRepoList, int rank) {
  List<TrendingRepo> newList = [];
  for (TrendingRepo repo in starredRepoList) {
    if (repo.rank != rank) {
      newList.add(repo);
    }
  }
  return newList;
}
