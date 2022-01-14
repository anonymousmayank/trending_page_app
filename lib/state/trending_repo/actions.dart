import 'package:trending_page_app/state/models/trendingRepoModel.dart';

class LoadTrendingRepo{
  Function? successCallback;
  Function? errorCallback;
  bool? forceFetch;
  LoadTrendingRepo({this.successCallback, this.errorCallback, this.forceFetch});
}

class LoadTrendingRepoSuccess{
  List<TrendingRepo>? trendingRepoList;
  LoadTrendingRepoSuccess({this.trendingRepoList});
}
