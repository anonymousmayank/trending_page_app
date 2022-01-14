import 'package:flutter/material.dart';

import 'package:trending_page_app/constants/widgets.dart';
import 'package:trending_page_app/trending_page/local_widgets/loading_card.dart';
import 'package:trending_page_app/trending_page/local_widgets/trending_card.dart';

class TrendingPage extends StatefulWidget {
  const TrendingPage({Key? key}) : super(key: key);

  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  int expandedRepo = -1;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: baseAppBar,
        body: Container(
          child: ListView.builder(
            itemCount: 5,
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
                        username: 'Mayankesh Mishra',
                        repoName: 'Kutumbh App',
                        description:
                            'Application for assignment of Kutumbh recruitment Kutumbh recruitment Kutumbh recruitment Kutumbh recruitment Kutumbh recruitment',
                        language: 'Dart',
                        languageColor: '#3572A5',
                        stars: 265789,
                        forks: 12345,
                        avatarUrl:
                            'https://avatars.githubusercontent.com/u/1666888?s=40&v=4',
                        expanded: expandedRepo == index,
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
