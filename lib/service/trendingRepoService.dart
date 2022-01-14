import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trending_page_app/state/models/trendingRepoModel.dart';

Future<List<TrendingRepo>>? fetchTrendingRepo(Function? errorCallback) async {
  try{
    String url = "https://gh-trending-api.herokuapp.com/repositories";
    final response = await http.get(Uri.parse(url));
    return decodeTrendingRepo(response.body);
  }
  catch(e){
    errorCallback!();
  }
  return [];
}

List<TrendingRepo> decodeTrendingRepo(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<TrendingRepo>((json) => TrendingRepo.fromJson(json))
      .toList();
}
