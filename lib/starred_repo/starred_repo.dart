import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:trending_page_app/constants/colors.dart';
import 'package:trending_page_app/constants/text_styles.dart';

import 'package:trending_page_app/constants/widgets.dart';
import 'package:trending_page_app/error_page/error_page.dart';
import 'package:trending_page_app/state/models/trendingRepoModel.dart';
import 'package:trending_page_app/state/starred_repo/action.dart';
import 'package:trending_page_app/state/store.dart';
import 'package:trending_page_app/trending_page/local_widgets/loading_card.dart';
import 'package:trending_page_app/trending_page/local_widgets/trending_card.dart';
import 'package:trending_page_app/trending_page/trending_page.dart';

class StarredRepoPage extends StatefulWidget {
  const StarredRepoPage({Key? key}) : super(key: key);

  @override
  _StarredRepoPageState createState() => _StarredRepoPageState();
}

class _StarredRepoPageState extends State<StarredRepoPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  Store? _store;
  int expandedRepo = -1;
  bool isLoading = true;
  bool isError = false;
  bool isEmpty = false;

  void _successCallback() {
    print('Success Callback Called');
    setState(() {
      isLoading = false;
      if (isError) {
        isError = false;
      }
      if (_store!.state.starredRepoList.length <= 0) {
        isEmpty = true;
      } else {
        isEmpty = false;
      }
    });
  }

  void _errorCallback() {
    print('Error Callback Called');
    setState(() {
      isError = true;
    });
  }

  _fetchTrendingRepo(store) {
    _store = store;
    store.dispatch(LoadStarredRepo(
      successCallback: _successCallback,
      errorCallback: _errorCallback,
    ));
  }

  void _onRefresh() async {
    setState(() {
      isLoading = true;
    });
    if (_store != null) {
      _store!.dispatch(LoadStarredRepo(
        successCallback: _successCallback,
        errorCallback: _errorCallback,
      ));
    }
    _refreshController.refreshCompleted();
  }

  void starRepo(TrendingRepo repo) {
    _store!.dispatch(AddStarredRepo(
      successCallback: _successCallback,
      errorCallback: _errorCallback,
      repo: repo,
    ));
  }

  void unStarRepo(TrendingRepo repo) {
    _store!.dispatch(RemoveStarredRepo(
      successCallback: _successCallback,
      errorCallback: _errorCallback,
      repo: repo,
    ));
  }

  bool _checkStarred(List<TrendingRepo> starredRepoList, int rank) {
    for (TrendingRepo repo in starredRepoList) {
      if (repo.rank == rank) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: baseAppBar('Starred Repositories'),
        body: StoreConnector<AppState, AppState>(
          onInit: _fetchTrendingRepo,
          converter: (_store) => _store.state,
          builder: (context, state) => SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            onRefresh: _onRefresh,
            child: Container(
              child: isError
                  ? CustomErrorWidget(
                      retryCallback: _fetchTrendingRepo,
                      store: _store,
                    )
                  : isEmpty
                      ? Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    'Star some Repositories to view them here.',
                                    textAlign: TextAlign.center,
                                    style: heading2.copyWith(color: darkGrey),
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TrendingPage()));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: secondary,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Trending Page',
                                        style: heading2.copyWith(color: white),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        )
                      : ListView.builder(
                          itemCount:
                              isLoading ? 10 : state.starredRepoList?.length,
                          itemBuilder: (context, index) {
                            return isLoading
                                ? LoadingCard()
                                : GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (expandedRepo == index) {
                                          expandedRepo = -1;
                                        } else {
                                          expandedRepo = index;
                                        }
                                      });
                                    },
                                    child: TrendingCard(
                                      username: state
                                          .starredRepoList?[index].username,
                                      repoName: state.starredRepoList?[index]
                                          .repositoryName,
                                      description: state
                                          .starredRepoList?[index].description,
                                      language: state
                                          .starredRepoList?[index].language,
                                      languageColor: state
                                          .starredRepoList?[index]
                                          .languageColor,
                                      stars: (state.starredRepoList?[index]
                                                  .totalStars !=
                                              null)
                                          ? state.starredRepoList![index]
                                              .totalStars!
                                              .toDouble()
                                          : 0,
                                      forks: (state.starredRepoList?[index]
                                                  .forks !=
                                              null)
                                          ? state.starredRepoList![index].forks!
                                              .toDouble()
                                          : 0,
                                      avatarUrl: state.starredRepoList?[index]
                                          .builtBy![0].avatar,
                                      expanded: expandedRepo == index,
                                      isStarred: _checkStarred(
                                          state.starredRepoList!,
                                          state.starredRepoList![index].rank!),
                                      repo: state.starredRepoList![index],
                                      starRepoCallback: starRepo,
                                      unstarRepoCallback: unStarRepo,
                                    ),
                                  );
                          },
                        ),
            ),
          ),
        ),
      ),
    );
  }
}
