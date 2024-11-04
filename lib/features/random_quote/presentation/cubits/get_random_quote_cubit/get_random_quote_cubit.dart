import 'package:dartz/dartz.dart';
import 'package:echoes/core/error/failures.dart';
import 'package:echoes/core/utils/app_strings.dart';
import 'package:echoes/features/random_quote/domain/entities/quote.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../domain/usecases/get_random_quote_use_case.dart';

part 'get_random_quote_states.dart';

class GetRandomQuoteCubit extends Cubit<GetRandomQuoteStates> {
  final GetRandomQuoteUseCase getRandomQuoteUseCase;

  GetRandomQuoteCubit({required this.getRandomQuoteUseCase})
      : super(GetRandomQuoteInitialState());

  Future<void> getRandomQuote() async {
    emit(GetRandomQuoteLoadingState());

    final Either<Failure, Quote> result =
        await getRandomQuoteUseCase(NoParams());

    result.fold(
        (failure) => emit(
              GetRandomQuoteFailureState(
                msg: _mapFailureToMessage(
                  failure,
                ),
              ),
            ),
        (quote) => emit(GetRandomQuoteSuccessfulState(quote: quote)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return AppStrings.serverFailure;
      case CacheFailure _:
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unExpectedError;
    }
  }
}
