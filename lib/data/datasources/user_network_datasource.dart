import 'package:flutter_arch_github/data/models/profile.dart';
import 'package:flutter_arch_github/domain/entities/profile.dart';

abstract class UserNetworkDatasource {
  Future<ProfileData> getUsers(String name);
}