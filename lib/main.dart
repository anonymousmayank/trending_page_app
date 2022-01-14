import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:trending_page_app/home_page.dart';
import 'package:trending_page_app/state/store.dart';
import 'package:trending_page_app/state/trending_repo/thunk.dart';

void main() {
  Store<AppState> _store = Store<AppState>(appReducer,
      initialState: AppState.initial(), middleware: [trendingRepoThunk]);
  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Kutumbh App',
        home: HomePage(),
      ),
    );
  }
}
