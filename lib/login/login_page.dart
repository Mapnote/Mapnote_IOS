import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login/find_user_info.dart';
import '../login/join_page.dart';

import '../mapnote_main.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

// import '../components/main_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void logIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear();

    var url = 'http://api.mapnote.link:8080/api/v1/users/login';
    var body = {
      "email": _emailController.text,
      "password": _passwordController.text,
    };

    var response = await http.post(Uri.parse(url),
        body: json.encode(body),
        headers: {"Content-Type": "application/json"},
        encoding: Encoding.getByName("utf-8"));

    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = json.decode(response.body);

      print(data);

      prefs.setString('accessToken', data['data']['accessToken']);
      prefs.setString('refreshToken', data['data']['refreshToken']);

      while(true) {
        var user_response = await http.get(Uri.parse('http://api.mapnote.link:8080/api/v1/users'),
          headers: {
            "Authorization": prefs.getString('accessToken'),
          },
        );

        if (user_response.statusCode == 200 || user_response.statusCode == 201) {
          var userData = jsonDecode(utf8.decode(user_response.bodyBytes));

          prefs.setString('userName', userData['data']['name']);
          prefs.setDouble('boundary', userData['data']['boundary']);

          break;
        } else if(user_response.statusCode == 401) {

          var token_body = {
            "accessToken": data['data']['accessToken'],
            "refreshToken": data['data']['refreshToken'],
          };

          var token_response = await http.post(Uri.parse('http://api.mapnote.link:8080/api/v1/users/reissue'),
              body: json.encode(token_body),
              headers: {"Content-Type": "application/json"},
              encoding: Encoding.getByName("utf-8"));

          var token_data = json.decode(token_response.body);

          prefs.setString('accessToken', token_data['data']['accessToken']);
          prefs.setString('refreshToken', token_data['data']['refreshToken']);

          continue;
        } else{
          throw Exception('Failed to load data');
        }

      }
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => MapnoteMain())
      );
    } else {
      throw Exception('Failed to load data');
    }
  }


  void kakaoLogIn() async {
    // TODO: ????????? ?????? ????????? ?????? ?????? ??????
    print(_emailController);
    print(_passwordController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              SizedBox(height: 60.0),
              Column(
                children: <Widget>[
                  Text(
                    'Mapnote',
                    style: TextStyle(
                      fontFamily: "Roboto",
                      color: Color.fromRGBO(255, 147, 101, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 30.0),

                  Text(
                    '???????????? ?????? ?????? ???????????????!',
                    style: TextStyle(
                      fontFamily: "NotoSansKR",
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 8.0),

                  Text(
                    '????????? ????????? ?????? ???????????? ???????????????.',
                    style: TextStyle(
                      fontFamily: "NotoSansKR",
                      color: Color.fromRGBO(136, 136, 136, 1),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30.0),

              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(248, 248, 248, 1),
                      )
                  ),
                  hintText: '?????????',
                ),
              ),

              SizedBox(height: 6.0),

              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(248, 248, 248, 1),
                      )
                  ),
                  hintText: '????????????',
                ),
                obscureText: true,  // ???????????? ????????? ??????
              ),

              SizedBox(height: 30.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => FindUserInfo('id'))
                        );
                      },
                      child: Text(
                        '????????? ??????',
                        style: TextStyle(
                          fontFamily: "NotoSansKR",
                          color: Color.fromRGBO(136, 136, 136, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                  ),
                  SizedBox(width: 19),
                  Container(
                    width: 1,
                    height: 15,
                    color: Color.fromRGBO(136, 136, 136, 1),
                  ),
                  SizedBox(width: 12),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => FindUserInfo('pw'))
                        );
                      },
                      child: Text(
                        '???????????? ??????',
                        style: TextStyle(
                          fontFamily: "NotoSansKR",
                          color: Color.fromRGBO(136, 136, 136, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                  ),
                  SizedBox(width: 13),
                  Container(
                    width: 1,
                    height: 15,
                    color: Color.fromRGBO(136, 136, 136, 1),
                  ),
                  SizedBox(width: 27),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => JoinPage())
                        );
                      },
                      child: Text(
                        '????????????',
                        style: TextStyle(
                          fontFamily: "NotoSansKR",
                          color: Color.fromRGBO(136, 136, 136, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                  ),
                ],
              ),

              SizedBox(height: 60.0),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  primary: Color.fromRGBO(255, 147, 101, 1),
                  minimumSize: Size(320,56),
                  // alignment: Alignment.center,
                ),
                child: Text(
                  '?????????',
                  style: TextStyle(
                    fontFamily: "NotoSansKR",
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () => logIn(),
              ),

              SizedBox(height: 60.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 1,
                    width: 100,
                    color: Color.fromRGBO(136, 136, 136, 1),
                  ),
                  SizedBox(width: 26),
                  Text(
                    '?????? ?????????',
                    style: TextStyle(
                      fontFamily: "NotoSansKR",
                      color: Color.fromRGBO(136, 136, 136, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 26),
                  Container(
                    height: 1,
                    width: 100,
                    color: Color.fromRGBO(136, 136, 136, 1),
                  ),
                ],
              ),

              SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)
                  ),
                  primary: Color.fromRGBO(254, 229, 0, 1),
                  minimumSize: Size(319,48),
                  // alignment: Alignment.center,
                ),
                child: Text(
                  '?????????????????? ????????????',
                  style: TextStyle(
                    fontFamily: "NotoSansKR",
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () => kakaoLogIn(),
              ),
            ],
          ),
        ),

      )
    );
  }
}

// TODO
// ios ?????? ???????????? ?????? -> ????????? ????????? ?????? ??????

// Center(
// child: CupertinoButton(
// borderRadius: BorderRadius.circular(8.0),
// color: Color.fromRGBO(255, 147, 101, 1),
// minSize: 100,
// child: Text(
// '?????????',
// style: TextStyle(
// fontFamily: "NotoSansKR",
// color: Colors.white,
// fontSize: 16,
// fontWeight: FontWeight.w700,
// ),
// ),
// onPressed: () {},
// ),
// ),

// button ?????? ?????????

// ButtonBar(
// children: <Widget>[
// FlatButton(
// child: Text('CANCEL'),
// onPressed: () {
// _emailController.clear();
// _passwordController.clear();
// },
// ),
// RaisedButton(
// child: Text('NEXT'),
// onPressed: () {
// Navigator.pop(context);
// },
// ),
// ],
// ),