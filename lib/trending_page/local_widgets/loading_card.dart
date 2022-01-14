import 'package:flutter/material.dart';
import 'package:trending_page_app/constants/colors.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 100;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: borderPrimary,
          ),
          bottom: BorderSide(
            width: 1,
            color: borderPrimary,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: lightGrey,
            ),
            width: 48,
            height: 48,
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: lightGrey,
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 10,
                width: width * 0.4,
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: lightGrey,
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 10,
                width: width * 0.92,
              )
            ],
          ),
        ],
      ),
    );
  }
}
