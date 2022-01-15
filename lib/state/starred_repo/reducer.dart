import 'package:trending_page_app/state/models/trendingRepoModel.dart';
import 'package:trending_page_app/state/starred_repo/action.dart';

List<TrendingRepo>? starredRepoReducer(
  List<TrendingRepo>? starredRepoList,
  dynamic action,
) {
  if (action is LoadStarredRepo) {
    return starredRepoList;
  } else if (action is LoadStarredRepoSuccess) {
    print(action.starredRepoList);
    return action.starredRepoList;
  } else if (action is AddStarredRepo) {
    return starredRepoList;
  } else if (action is AddStarredRepoSuccess) {
    return action.starredRepoList;
  } else if (action is RemoveStarredRepo) {
    return starredRepoList;
  } else if (action is RemoveStarredRepoSuccess) {
    return action.starredRepoList;
  }
  return starredRepoList;
}
