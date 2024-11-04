import 'package:echoes/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../features/random_quote/presentation/widgets/quote_app_bar.dart';

class ErrorQuote extends StatelessWidget {
  const ErrorQuote({super.key, required this.msg});

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: quoteAppBar(),
      body: Center(
        child: Text(
          msg,
          style: TextStyles.font24PurpleBold,
        ),
      ),
    );
  }
}
