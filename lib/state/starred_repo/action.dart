import 'package:trending_page_app/state/models/trendingRepoModel.dart';

class LoadStarredRepo{
  Function? successCallback;
  Function? errorCallback;
  LoadStarredRepo({this.successCallback, this.errorCallback});
}

class LoadStarredRepoSuccess {
  List<TrendingRepo>? starredRepoList;
  LoadStarredRepoSuccess({this.starredRepoList});
}

class AddStarredRepo{
  TrendingRepo? repo;
  Function? successCallback;
  Function? errorCallback;
  AddStarredRepo({this.repo, this.successCallback, this.errorCallback});
}

class AddStarredRepoSuccess {
  List<TrendingRepo>? starredRepoList;
  AddStarredRepoSuccess({this.starredRepoList});
}

class RemoveStarredRepo{
  TrendingRepo? repo;
  Function? successCallback;
  Function? errorCallback;
  RemoveStarredRepo({this.repo, this.successCallback, this.errorCallback});
}

class RemoveStarredRepoSuccess {
  List<TrendingRepo>? starredRepoList;
  RemoveStarredRepoSuccess({this.starredRepoList});
}
