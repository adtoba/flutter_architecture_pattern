import 'package:flutter/material.dart';
import 'package:flutter_arch_github/data/models/profile.dart';
import 'package:flutter_arch_github/domain/entities/profile.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen(this.profile);

  ProfileData profile;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double deviceHeight = size.height;
    double deviceWidth = size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('${profile.name}'),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  elevation: 5.0,
                  child: Container(
                    width: deviceWidth,
                    height: 300.0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                              child: Image.network(
                            '${profile.avatarUrl}',
                            width: 1000,
                            height: 100.0,
                          )),

                          SizedBox(height: 10.0,),


                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Name: ',
                                  style: TextStyle(color: Colors.black, fontFamily: 'MuseoSans')
                                ),
                                TextSpan(
                                  text: '${profile.name}',
                                  style: TextStyle(color: Colors.red, fontFamily: 'MuseoSans')
                                )
                              ]
                            ),
                          ),

                          SizedBox(height: 10.0,),

                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Username: ',
                                  style: TextStyle(color: Colors.black, fontFamily: 'MuseoSans')
                                ),
                                TextSpan(
                                  text: '${profile.login}',
                                  style: TextStyle(color: Colors.red, fontFamily: 'MuseoSans')
                                )
                              ]
                            ),
                          ),

                          SizedBox(height: 10.0,),

                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Email: ',
                                  style: TextStyle(color: Colors.black, fontFamily: 'MuseoSans')
                                ),
                                TextSpan(
                                  text: '${profile.email}',
                                  style: TextStyle(color: Colors.red, fontFamily: 'MuseoSans')
                                )
                              ]
                            ),
                          ),

                          SizedBox(height: 10.0,),

                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Followers: ',
                                  style: TextStyle(color: Colors.black, fontFamily: 'MuseoSans')
                                ),
                                TextSpan(
                                  text: '${profile.followers}',
                                  style: TextStyle(color: Colors.red, fontFamily: 'MuseoSans')
                                )
                              ]
                            ),
                          ),

                          SizedBox(height: 10.0,),

                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Bio: ',
                                  style: TextStyle(color: Colors.black, fontFamily: 'MuseoSans')
                                ),
                                TextSpan(
                                  text: '${profile.bio}',
                                  style: TextStyle(color: Colors.red, fontFamily: 'MuseoSans')
                                )
                              ]
                            ),
                          )


                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
