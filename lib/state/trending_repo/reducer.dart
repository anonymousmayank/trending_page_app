import 'package:trending_page_app/state/models/trendingRepoModel.dart';
import 'package:trending_page_app/state/trending_repo/actions.dart';

List<TrendingRepo>? trendingRepoReducer(
  List<TrendingRepo>? trendingRepoList,
  dynamic action,
) {
  if (action is LoadTrendingRepo) {
    return trendingRepoList;
  } else if (action is LoadTrendingRepoSuccess) {
    return action.trendingRepoList;
  }
  return trendingRepoList;
}
