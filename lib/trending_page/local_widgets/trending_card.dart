import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';

import 'package:trending_page_app/constants/colors.dart';
import 'package:trending_page_app/constants/constants.dart';
import 'package:trending_page_app/constants/text_styles.dart';
import 'package:trending_page_app/state/models/trendingRepoModel.dart';

class TrendingCard extends StatelessWidget {
  TrendingCard({
    this.username,
    this.repoName,
    this.description,
    this.language,
    this.languageColor,
    this.stars,
    this.forks,
    this.avatarUrl,
    this.expanded = false,
    this.isStarred = false,
    this.repo,
    this.starRepoCallback,
    this.unstarRepoCallback,
    Key? key,
  }) : super(key: key);

  final String? username;
  final String? repoName;
  final String? description;
  final String? language;
  final String? languageColor;
  final double? stars;
  final double? forks;
  final String? avatarUrl;
  final bool expanded;
  final bool isStarred;
  final TrendingRepo? repo;
  final Function? starRepoCallback;
  final Function? unstarRepoCallback;

  int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    MoneyFormatter starsFormatter =
        MoneyFormatter(amount: stars != null ? stars! : 0);
    MoneyFormatter forksFormatter =
        MoneyFormatter(amount: forks != null ? forks! : 0);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: borderPrimary,
          ),
          bottom: BorderSide(
            width: expanded ? 3 : 1,
            color: borderPrimary,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 24,
            backgroundImage: avatarUrl != null
                ? NetworkImage(avatarUrl!)
                : AssetImage('$assetPath/profileDemo.png') as ImageProvider,
          ),
          const SizedBox(width: 15),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints(maxWidth: screenWidth * 0.6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            username ?? '',
                            style: heading3,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            repoName ?? '',
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            style: heading2.copyWith(
                              color: black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (isStarred) {
                          unstarRepoCallback!(repo);
                        } else {
                          starRepoCallback!(repo);
                        }
                      },
                      icon: Icon(
                        isStarred ? Icons.star : Icons.star_border,
                        color: golden,
                        size: 30,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                if (expanded)
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          description ?? '',
                          style: heading3,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.fiber_manual_record,
                              color: languageColor != null
                                  ? Color(getColorFromHex(languageColor!))
                                  : black,
                              size: 12,
                            ),
                            const SizedBox(width: 4),
                            Text(language ?? ''),
                            const SizedBox(width: 10),
                            Icon(
                              Icons.star_rate,
                              color: golden,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(starsFormatter.output.nonSymbol),
                            const SizedBox(width: 10),
                            Image.asset('$assetPath/gitFork.png', width: 24),
                            Text(forksFormatter.output.nonSymbol)
                          ],
                        )
                      ],
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
