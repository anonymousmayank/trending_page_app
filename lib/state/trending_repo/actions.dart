import 'package:trending_page_app/state/models/trendingRepoModel.dart';

class LoadTrendingRepo{
  Function? successCallback;
  Function? errorCallback;
  LoadTrendingRepo({this.successCallback, this.errorCallback});
}

class LoadTrendingRepoSuccess{
  List<TrendingRepo>? trendingRepoList;
  LoadTrendingRepoSuccess({this.trendingRepoList});
}
