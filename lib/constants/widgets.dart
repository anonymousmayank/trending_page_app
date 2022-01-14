import 'package:flutter/material.dart';

import 'package:trending_page_app/constants/text_styles.dart';

PreferredSizeWidget baseAppBar = AppBar(
  automaticallyImplyLeading: false,
  backgroundColor: Colors.white,
  elevation: 0,
  title: Center(
    child: Text(
      'Trending',
      style: heading1.copyWith(color: Colors.black),
    ),
  ),
  actions: [
    IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.more_vert,
        color: Colors.black,
      ),
    ),
  ],
);
