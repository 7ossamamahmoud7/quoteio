import 'package:echoes/core/utils/app_colors.dart';
import 'package:echoes/core/utils/styles.dart';
import 'package:echoes/features/random_quote/domain/entities/quote.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuoteContent extends StatelessWidget {
  const QuoteContent({
    super.key,
    required this.quote,
  });

  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primaryColor,
      ),
      child: Column(
        children: [
          Text(
            quote.quote,
            style: TextStyles.font22WhiteMedium,
            textAlign: TextAlign.center,
            maxLines: 10,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            "“${quote.author}”",
            style: TextStyles.font22WhiteMedium,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
