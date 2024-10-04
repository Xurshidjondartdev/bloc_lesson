import 'package:bloc_lesson/data/repository/app_repository.dart';
import 'package:bloc_lesson/data/repository/app_repository_impl.dart';
import 'package:bloc_lesson/data/source/api.dart';
import 'package:bloc_lesson/data/source/data_source.dart';
import 'package:bloc_lesson/feature/post/bloc/post_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setopLocator() {
  ///network
  locator.registerLazySingleton<Network>(() {
    final client = DioService(dio: Dio());
    client.configuration(Api.baseUrl);
    return client;
  });

  ///repository
  locator.registerLazySingleton<AppRepository>(() => AppRepositoryImpl(network: locator()));

  ///bloc
  locator.registerLazySingleton<PostBloc>(() => PostBloc(repository: locator()));
}
