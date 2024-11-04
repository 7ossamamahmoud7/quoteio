import 'package:dartz/dartz.dart';
import 'package:echoes/core/error/exceptions.dart';
import 'package:echoes/core/error/failures.dart';
import 'package:echoes/core/networking/network_info.dart';
import 'package:echoes/features/random_quote/domain/entities/quote.dart';

import '../../domain/repos/random_quote_repo.dart';
import '../datasources/random_quote_local_data_source.dart';
import '../datasources/random_quote_remote_data_source.dart';

class RandomQuoteRepositoryImpl implements RandomQuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;

  RandomQuoteRepositoryImpl(
      {required this.networkInfo,
      required this.randomQuoteRemoteDataSource,
      required this.randomQuoteLocalDataSource});

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final quote = await randomQuoteRemoteDataSource.getRandomQuote();
        await randomQuoteLocalDataSource.cacheQuote(quote);
        return Right(quote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final quote = await randomQuoteLocalDataSource.getLastRandomQuote();
        return Right(quote);
      } on CacheFailure {
        return Left(CacheFailure());
      }
    }
  }
}
