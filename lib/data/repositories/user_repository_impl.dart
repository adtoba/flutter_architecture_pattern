import 'package:dartz/dartz.dart';
import 'package:flutter_arch_github/commons/errors/failure.dart';
import 'package:flutter_arch_github/data/datasources/user_network_datasource.dart';
import 'package:flutter_arch_github/data/models/profile.dart';
import 'package:flutter_arch_github/domain/entities/profile.dart';
import 'package:flutter_arch_github/domain/repositories/user_repository.dart';
import 'package:flutter_arch_github/domain/usecases/get_user_account.dart';


class UserRepositoryImpl implements UserRepository {
  final UserNetworkDatasource networkDatasource;

  UserRepositoryImpl({
    this.networkDatasource
  });

  @override
  Future<Either<Failure, ProfileData>> getUsers(String name) async {
    try {
      final response = await networkDatasource.getUsers(name);
      return Right(response);
    } catch (e) {
      return Left(e);
    }
  }



  
}