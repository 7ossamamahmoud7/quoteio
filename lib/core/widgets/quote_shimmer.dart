import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerRefreshButton extends StatelessWidget {
  const ShimmerRefreshButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: CircleAvatar(
        backgroundColor: Colors.grey[300],
        minRadius: 24,
        maxRadius: 26,
        child: Icon(
          Icons.refresh_outlined,
          size: 36,
          color: Colors.white
              .withOpacity(0.5), // Adjust opacity for shimmer effect
        ),
      ),
    );
  }
}

class ShimmerQuoteContent extends StatelessWidget {
  const ShimmerQuoteContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[300],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Three lines for quote text
            Container(
              height: 20,
              width: double.infinity,
              color: Colors.grey[300],
              margin: EdgeInsets.symmetric(vertical: 8),
            ),
            Container(
              height: 20,
              width: double.infinity,
              color: Colors.grey[300],
              margin: EdgeInsets.symmetric(vertical: 8),
            ),
            Container(
              height: 20,
              width: double.infinity,
              color: Colors.grey[300],
              margin: EdgeInsets.symmetric(vertical: 8),
            ),
            SizedBox(height: 12),
            // Centered line for author text
            Container(
              height: 20,
              width: 120,
              color: Colors.grey[300],
              margin: EdgeInsets.symmetric(vertical: 8),
            ),
            SizedBox(
                height: 8.h), // Space between quote shimmer and refresh button
            const ShimmerRefreshButton(), // Shimmer for the refresh button
          ],
        ),
      ),
    );
  }
}
