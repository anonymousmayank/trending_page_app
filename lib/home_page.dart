import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: Text('Trending Page'),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Error Page'),
          ),
        ],
      ),
    );
  }
}
