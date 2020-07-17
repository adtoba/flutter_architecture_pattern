import 'package:dartz/dartz.dart';
import 'package:flutter_arch_github/commons/errors/failure.dart';
import 'package:flutter_arch_github/data/models/profile.dart';
import 'package:flutter_arch_github/domain/entities/profile.dart';

abstract class UserRepository {
  Future<Either<Failure, ProfileData>> getUsers(String name);
}