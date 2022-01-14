import 'package:flutter/material.dart';

import 'package:trending_page_app/trending_page/trending_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TrendingPage()));
                },
                child: Text('Trending Page'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Error Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
