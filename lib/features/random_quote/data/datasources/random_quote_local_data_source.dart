import 'dart:convert';

import 'package:echoes/core/utils/app_strings.dart';
import 'package:echoes/features/random_quote/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/failures.dart';

abstract class RandomQuoteLocalDataSource {
  Future<void> cacheQuote(QuoteModel quote);

  Future<QuoteModel> getLastRandomQuote();
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheQuote(QuoteModel quote) async {
    await sharedPreferences.setString(
      AppStrings.cachedRandomQuote,
      json.encode(quote.toJson()),
    );
  }

  @override
  Future<QuoteModel> getLastRandomQuote() async {
    final jsonString = sharedPreferences.getString(
      AppStrings.cachedRandomQuote,
    );

    if (jsonString != null) {
      return Future.value(QuoteModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheFailure();
    }
  }
}
