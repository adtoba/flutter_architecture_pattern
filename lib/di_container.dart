import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arch_github/data/datasources/user_network_datasource.dart';
import 'package:flutter_arch_github/data/repositories/user_repository_impl.dart';
import 'package:flutter_arch_github/domain/repositories/user_repository.dart';
import 'package:flutter_arch_github/domain/usecases/get_user_account.dart';
import 'package:flutter_arch_github/network/datasources/user_network_datasource_impl.dart';
import 'package:flutter_arch_github/presentation/notifiers/home_model.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  
  // to plain Provider version
  sl.registerFactory(
    () => HomeModel(getUserRepository: sl()),
  );
  
  sl.registerFactory(() => Dio());

  // * Domain Layer
  sl.registerFactory(() => GetUserRepository(userRepository: sl()));
  

  // * Data Layer
  sl.registerFactory<UserRepository>(() => UserRepositoryImpl(
     networkDatasource: sl()));

  // * Network Layer
  sl.registerFactory<UserNetworkDatasource>(
      () => UserNetworkDatasourceImpl(dio: sl()));

  
}