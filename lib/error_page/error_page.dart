import 'package:flutter/material.dart';
import 'package:trending_page_app/constants/colors.dart';
import 'package:trending_page_app/constants/constants.dart';
import 'package:trending_page_app/constants/text_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    this.retryCallback,
    Key? key,
  }) : super(key: key);

  final void Function()? retryCallback;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: backgroundPrimary,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  '$assetPath/errorPage.png',
                  width: width * 0.8,
                ),
                SizedBox(height: 10),
                Text(
                  'Something went wrong..',
                  style: heading2.copyWith(
                    color: black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'An alien is probably blocking your signal',
                  style: heading3.copyWith(
                    color: darkGrey,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              if (retryCallback != null) {
                retryCallback!();
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: white,
                border: Border.all(
                  width: 1,
                  color: secondary,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 12),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Center(
                child: Text(
                  'RETRY',
                  style: heading2.copyWith(
                    color: secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
