import 'package:dartz/dartz.dart';
import 'package:echoes/core/error/failures.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/quote.dart';
import '../repos/random_quote_repo.dart';

class GetRandomQuoteUseCase implements UseCase<Quote, NoParams> {
  final RandomQuoteRepository randomQuoteRepository;

  GetRandomQuoteUseCase({required this.randomQuoteRepository});

  @override
  Future<Either<Failure, Quote>> call(params) {
    return randomQuoteRepository.getRandomQuote();
  }
}
