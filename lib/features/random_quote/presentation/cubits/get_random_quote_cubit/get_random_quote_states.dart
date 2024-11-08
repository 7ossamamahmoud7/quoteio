part of 'get_random_quote_cubit.dart';

abstract class GetRandomQuoteStates extends Equatable {}

class GetRandomQuoteInitialState extends GetRandomQuoteStates {
  @override
  List<Object> get props => [];
}

class GetRandomQuoteLoadingState extends GetRandomQuoteStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetRandomQuoteSuccessfulState extends GetRandomQuoteStates {
  final Quote quote;
  GetRandomQuoteSuccessfulState({required this.quote});
  @override
  List<Object?> get props => [];
}

class GetRandomQuoteFailureState extends GetRandomQuoteStates {
  final String msg;

  GetRandomQuoteFailureState({required this.msg});
  @override
  List<Object?> get props => [];
}
