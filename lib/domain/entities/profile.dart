import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Profile extends Equatable {
   final String name;
   final String avatarUrl;
   final String bio;
   final int followers;
   final String email;
   final String url;
   final String login;


  Profile({
    @required this.name,
    @required this.email,
    @required this.bio,
    @required this.followers,
    @required this.url,
    @required this.avatarUrl,
    @required this.login
  });

  @override
  List<Object> get props => [name, avatarUrl, bio, followers, email, url, login];
}