import 'package:flutter/foundation.dart';
import 'package:flutter_arch_github/data/models/profile.dart';
import 'package:flutter_arch_github/domain/entities/profile.dart';
import 'package:flutter_arch_github/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_arch_github/commons/errors/failure.dart';


class GetUserRepository {
  final UserRepository userRepository;

  GetUserRepository({@required this.userRepository});

  Future<Either<Failure, ProfileData>> call(String name) async {
    return userRepository.getUsers(name);
  }
}