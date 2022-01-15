import 'package:flutter/material.dart';
import 'package:trending_page_app/constants/constants.dart';
import 'package:trending_page_app/constants/text_styles.dart';
import 'package:trending_page_app/constants/widgets.dart';

import 'package:trending_page_app/starred_repo/starred_repo.dart';
import 'package:trending_page_app/trending_page/trending_page.dart';

import 'constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('$assetPath/logo.png'),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TrendingPage()));
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      'Trending Page',
                      style: heading2.copyWith(color: white),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StarredRepoPage()));
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      'Starred Repo Page',
                      style: heading2.copyWith(color: white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
