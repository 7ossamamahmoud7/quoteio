import 'package:echoes/features/random_quote/presentation/cubits/get_random_quote_cubit/get_random_quote_cubit.dart';
import 'package:echoes/features/random_quote/presentation/widgets/quote_app_bar.dart';
import 'package:echoes/features/random_quote/presentation/widgets/quote_content.dart';
import 'package:echoes/features/random_quote/presentation/widgets/quote_refresh_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/error_quote.dart';
import '../../../../core/widgets/quote_shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: quoteAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<GetRandomQuoteCubit, GetRandomQuoteStates>(
              builder: (context, state) {
                if (state is GetRandomQuoteSuccessfulState) {
                  return QuoteContent(quote: state.quote);
                } else if (state is GetRandomQuoteFailureState) {
                  return ErrorQuote(msg: state.msg);
                } else if (state is GetRandomQuoteLoadingState) {
                  return Column(
                    children: [
                      const ShimmerQuoteContent(), // Shimmer effect for quote content
                      SizedBox(height: 8.h),
                      const ShimmerRefreshButton(), // Shimmer effect for refresh button
                    ],
                  );
                }
                return SizedBox
                    .shrink(); // Return an empty widget if none of the states match
              },
            ),
            // Conditional rendering for the actual refresh button
            if (context.watch<GetRandomQuoteCubit>().state
                is! GetRandomQuoteLoadingState) ...[
              SizedBox(height: 8.h), // Space between quote and refresh button
              const QuoteRefreshButton(), // Actual refresh button
            ],
          ],
        ),
      ),
    );
  }
}
