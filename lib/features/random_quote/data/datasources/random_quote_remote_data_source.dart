import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:echoes/core/networking/end_points.dart';

import '../../../../core/error/exceptions.dart';
import '../models/quote_model.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl extends RandomQuoteRemoteDataSource {
  final Dio dio;

  RandomQuoteRemoteDataSourceImpl({required this.dio});

  @override
  Future<QuoteModel> getRandomQuote() async {
    try {
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
          HttpClient()
            ..badCertificateCallback =
                (X509Certificate cert, String host, int port) => true;
      final response = await dio.get(
        EndPoints.randomQuote,
      );
      return QuoteModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
      throw ServerException();
    }
  }
}
