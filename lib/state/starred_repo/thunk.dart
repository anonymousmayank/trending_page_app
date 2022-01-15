import 'package:redux/redux.dart';

import 'package:trending_page_app/service/starred_repo_service.dart';
import 'package:trending_page_app/state/starred_repo/action.dart';
import '../store.dart';

dynamic starredRepoThunk(
  Store<AppState> store,
  dynamic action,
  NextDispatcher next,
) {
  if (action is LoadStarredRepo) {
    fetchStarredRepo(
      action.errorCallback,
    )?.then((
      starredRepoList,
    ) {
      action.successCallback!();
      return store.dispatch(
        LoadStarredRepoSuccess(
          starredRepoList: starredRepoList,
        ),
      );
    }).catchError((e) => action.errorCallback!());
  } else if (action is AddStarredRepo) {
    addStarredRepo(
      action.repo!,
      action.errorCallback,
    )?.then((starredRepoList) {
      action.successCallback!();
      return store.dispatch(
        AddStarredRepoSuccess(
          starredRepoList: starredRepoList,
        ),
      );
    }).catchError((e) => action.errorCallback!());
  } else if (action is RemoveStarredRepo) {
    removeStarredRepo(
      action.repo!,
      action.errorCallback,
    )?.then((starredRepoList) {
      action.successCallback!();
      return store.dispatch(
        RemoveStarredRepoSuccess(
          starredRepoList: starredRepoList,
        ),
      );
    }).catchError((e) => action.errorCallback!());
  }
  next(action);
}
