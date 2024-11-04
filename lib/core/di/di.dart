import 'package:dio/dio.dart';
import 'package:echoes/features/random_quote/data/repos/random_quote_repo_impl.dart';
import 'package:echoes/features/random_quote/domain/repos/random_quote_repo.dart';
import 'package:echoes/features/random_quote/presentation/cubits/get_random_quote_cubit/get_random_quote_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/random_quote/data/datasources/random_quote_local_data_source.dart';
import '../../features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import '../../features/random_quote/domain/usecases/get_random_quote_use_case.dart';
import '../networking/network_info.dart';

final getIt = GetIt.instance;

initDi() async {
  getIt.registerLazySingleton<InternetConnection>(() => InternetConnection());
  getIt.registerLazySingleton<Dio>(() => Dio());
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() =>
      sharedPreferences); // use register factory instead of register singleton to  make it more testable and prevent memory leak
  // Repository
  getIt.registerLazySingleton<NetworkInfo>(() =>
      NetworkInfoImpl(connectionChecker: getIt.get<InternetConnection>()));
  // Data sources
  getIt.registerLazySingleton<RandomQuoteRemoteDataSource>(
    () => RandomQuoteRemoteDataSourceImpl(dio: getIt.get<Dio>()),
  );
  getIt.registerLazySingleton<RandomQuoteLocalDataSource>(
    () => RandomQuoteLocalDataSourceImpl(
        sharedPreferences: getIt<SharedPreferences>()),
  );
  getIt.registerLazySingleton<RandomQuoteRepository>(
    () => RandomQuoteRepositoryImpl(
      networkInfo: getIt.get<NetworkInfo>(),
      randomQuoteRemoteDataSource: getIt.get<RandomQuoteRemoteDataSource>(),
      randomQuoteLocalDataSource: getIt.get<RandomQuoteLocalDataSource>(),
    ),
  );
  getIt.registerLazySingleton<GetRandomQuoteUseCase>(() =>
      GetRandomQuoteUseCase(
          randomQuoteRepository: getIt.get<RandomQuoteRepository>()));

  // Use cases
  getIt.registerFactory<GetRandomQuoteCubit>(() => GetRandomQuoteCubit(
      getRandomQuoteUseCase: getIt.get<GetRandomQuoteUseCase>()));

  // Core

  // Connection checker
}
