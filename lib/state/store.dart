import 'package:trending_page_app/state/models/trendingRepoModel.dart';
import 'package:trending_page_app/state/starred_repo/reducer.dart';
import 'package:trending_page_app/state/trending_repo/reducer.dart';

class AppState {
  List<TrendingRepo>? trendingRepoList;
  List<TrendingRepo>? starredRepoList;
  AppState({this.trendingRepoList, this.starredRepoList});

  AppState.copyWith(
      {required AppState prevState,
      List<TrendingRepo>? trendingRepoList,
      List<TrendingRepo>? starredRepoList}) {
    this.trendingRepoList = trendingRepoList ?? prevState.trendingRepoList;
    this.starredRepoList = starredRepoList ?? prevState.starredRepoList;
  }

  AppState.initial() {
    this.trendingRepoList = <TrendingRepo>[];
    this.starredRepoList = <TrendingRepo>[];
  }
}

AppState appReducer(AppState prevState, action) => AppState(
      trendingRepoList: trendingRepoReducer(
        prevState.trendingRepoList,
        action,
      ),
      starredRepoList: starredRepoReducer(
        prevState.starredRepoList,
        action,
      ),
    );
