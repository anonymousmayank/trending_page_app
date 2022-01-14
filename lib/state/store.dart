import 'package:trending_page_app/state/models/trendingRepoModel.dart';
import 'package:trending_page_app/state/trending_repo/reducer.dart';

class AppState {
  List<TrendingRepo>? trendingRepoList;
  AppState({this.trendingRepoList});

  AppState.copyWith(
      {required AppState prevState, List<TrendingRepo>? trendingRepoList}) {
    this.trendingRepoList = trendingRepoList ?? prevState.trendingRepoList;
  }

  AppState.initial() {
    this.trendingRepoList = <TrendingRepo>[];
  }
}

AppState appReducer(AppState prevState, action) => AppState(
      trendingRepoList: trendingRepoReducer(
        prevState.trendingRepoList,
        action,
      ),
    );
