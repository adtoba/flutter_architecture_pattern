import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_arch_github/data/models/profile.dart';
import 'package:flutter_arch_github/domain/entities/profile.dart';
import 'package:flutter_arch_github/domain/usecases/get_user_account.dart';
import 'package:flutter_arch_github/presentation/enum/status.dart';


class HomeModel extends ChangeNotifier {
  GetUserRepository _getUserRepository;

  HomeModel({
    @required GetUserRepository getUserRepository
  }) : _getUserRepository = getUserRepository;


  Status _status; 
  Status get status => _status;

  String _error;
  String get error => _error;

  ProfileData _profile;
  ProfileData get profile => _profile;

  Future<void> getUser(String name) async {
    _status = Status.LOADING;
    notifyListeners();
    final result = await _getUserRepository(name);
    result.fold(
      (e) {
        _error = 'fail';
        _status = Status.FAILED;
        notifyListeners();
      },
      (ProfileData profilee) {
        _profile = profilee;
        _status = Status.LOADED;
        notifyListeners();
      }
    );
  } 

  void resetStatus() {
    _status = null;
    notifyListeners();
  }
  
}
