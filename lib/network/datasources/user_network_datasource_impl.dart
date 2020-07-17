import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_arch_github/data/datasources/user_network_datasource.dart';
import 'package:flutter_arch_github/data/models/profile.dart';


class UserNetworkDatasourceImpl implements UserNetworkDatasource {

  final Dio dio;

  UserNetworkDatasourceImpl({
    @required this.dio
  });


  @override
  Future<ProfileData> getUsers(String name) async {
    final response = await dio.get(
      'https://api.github.com/users/$name',
    );

    if(response.statusCode == 200) {
      Map<String, dynamic> result = response.data;
      ProfileData profileData = ProfileData.fromJson(result);

      return profileData;
    } else {
      throw Exception;
    }
  }

}