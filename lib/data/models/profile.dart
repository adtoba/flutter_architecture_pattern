import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class ProfileData {
   ProfileData({
    @required this.name,
    @required this.email,
    @required this.bio,
    @required this.followers,
    @required this.url,
    @required this.avatarUrl,
    @required this.login
  });

   String name;
   String avatarUrl;
   String bio;
   int followers;
   String email;
   String url;
   String login;

  String get namee => this.name;


  factory ProfileData.fromJson(Map<String, dynamic> jsonResponse) {
    return ProfileData(
      name: jsonResponse['name'],
      email: jsonResponse['email'],
      bio:  jsonResponse['bio'],
      url: jsonResponse['url'],
      avatarUrl: jsonResponse['avatar_url'],
      followers: jsonResponse['followers'],
      login: jsonResponse['login']
    );
  }
}