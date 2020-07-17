import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_arch_github/presentation/enum/status.dart';
import 'package:flutter_arch_github/presentation/notifiers/home_model.dart';
import 'package:flutter_arch_github/presentation/pages/profile_screen.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double deviceHeight = size.height;
    double deviceWidth = size.width;


    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text('Profile me', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Consumer<HomeModel>(
        builder: (context, model, child) => Stack(
          children: <Widget>[
            Container(
              height: deviceHeight,
              width: deviceWidth,
              color: Colors.white,
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: deviceWidth,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 80.0, left: 20.0, right: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Hello, ',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Type a username ',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black38,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Form(
                            key: _formKey,
                            child: TextFormField(
                              controller: _userNameController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  hintText: 'Search github profile',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(4.0))),
                              validator: (String content) {
                                if (content.length <= 0) {
                                  return 'Field cannot be empty';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Selector<HomeModel, Status>(
                            selector: (BuildContext context, HomeModel model)
                              => model.status,
                            builder: (BuildContext context, Status opStatus, _) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                if(opStatus == Status.LOADED) {
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return ProfileScreen(model.profile);
                                    }));
                                  model.resetStatus();
                                } else if(opStatus == Status.FAILED) {
                                  print('An error occured');
                                  model.resetStatus();
                                }
                              });
                              return Container(height: 0.0);
                            },
                          ),
                          Center(
                            child: Visibility(
                              visible:
                                  model.status == Status.LOADING ? true : false,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          GestureDetector(
                            onTap: ()  {
                             
                              if (_formKey.currentState.validate()) {
                                model.getUser(_userNameController.text)
                                    .then((response) {
                                  if (model.status == Status.LOADED) {
                                    
                                    
                                  } else {
                                    showSnackBar(context, 'Cannot get profile');
                                  }
                                });
                              }
                            },
                            child: Center(
                              child: Container(
                                width: 300.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Center(
                                  child: Text('SEARCH',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  showSnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$message'),
    ));
  }
}
