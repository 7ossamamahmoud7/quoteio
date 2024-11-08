import 'package:echoes/features/random_quote/presentation/cubits/get_random_quote_cubit/get_random_quote_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';

class QuoteRefreshButton extends StatelessWidget {
  const QuoteRefreshButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.primaryColor,
      minRadius: 24,
      maxRadius: 26,
      child: IconButton(
        icon: const Icon(
          Icons.refresh_outlined,
          size: 36,
          color: Colors.white,
        ),
        onPressed: () {
          BlocProvider.of<GetRandomQuoteCubit>(context).getRandomQuote();
        },
      ),
    );
  }
}
