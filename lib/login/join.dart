import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_note/login/join_complete.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Join extends StatefulWidget {
  @override
  _JoinState createState() => _JoinState();
}

class _JoinState extends State<Join> {

  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _codeController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool isEmailVerified = false;
  bool isCodeVerified = false;

  void verifyEmail() async {
    var url = 'http://api.mapnote.link:8080/api/v1/users/email';
    var body = {
      "email": _emailController.text,
    };

    var data = await http.post(Uri.parse(url),
        body: json.encode(body),
        headers: {"Content-Type": "application/json"},
        encoding: Encoding.getByName("utf-8"));

    if (data.statusCode == 200) {
      isEmailVerified = true;
    } else {
      throw Exception('Failed to load data');
    }
  }

  void verifyCode() {
    // TODO: 인증코드 확 기능 구현하기
    isCodeVerified = true;
  }

  void SignUp() async {
    if(isCodeVerified && isEmailVerified) {
      var url = 'http://api.mapnote.link:8080/api/v1/users';
      var body = {
        "email": _emailController.text,
        "password": _passwordController.text,
        "name": _nameController.text,
      };

      var data = await http.post(Uri.parse(url),
          body: json.encode(body),
          headers: {"Content-Type": "application/json"},
          encoding: Encoding.getByName("utf-8"));


      if (data.statusCode == 200 || data.statusCode == 201) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => JoinComplete(_nameController.text))
        );
      } else {
        throw Exception('Failed to load data');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '회원가입',
          style: TextStyle(
            fontFamily: "NotoSansKR",
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Color.fromRGBO(136, 136, 136, 1),
        ),
        shadowColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          children: <Widget>[
            SizedBox(height: 60.0),

            Text(
              '이메일',
              style: TextStyle(
                fontFamily: "NotoSansKR",
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),

            Row(
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Color.fromRGBO(136, 136, 136, 1),
                          )
                      ),
                      hintText: '이메일을 입력해주세요',
                      hintStyle: TextStyle(
                        fontFamily: "NotoSansKR",
                        color: Color.fromRGBO(204, 204, 204, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  // margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                      ),
                      primary: Color.fromRGBO(255, 147, 101, 1),
                      minimumSize: Size(80,32),
                      // alignment: Alignment.center,
                    ),
                    child: Text(
                      '중복확인',
                      style: TextStyle(
                        fontFamily: "NotoSansKR",
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () => verifyEmail(),
                  ),
                ),
              ],
            ),

            SizedBox(height: 40.0),

            Text(
              '인증코드',
              style: TextStyle(
                fontFamily: "NotoSansKR",
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),

            Row(
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  child: TextField(
                    controller: _codeController,
                    decoration: InputDecoration(
                      filled: true,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Color.fromRGBO(136, 136, 136, 1),
                          )
                      ),
                      hintText: '인증코드를 입력해주세요',
                      hintStyle: TextStyle(
                        fontFamily: "NotoSansKR",
                        color: Color.fromRGBO(204, 204, 204, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  // margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                      ),
                      primary: Color.fromRGBO(255, 147, 101, 1),
                      minimumSize: Size(80,32),
                      // alignment: Alignment.center,
                    ),
                    child: Text(
                      '확인',
                      style: TextStyle(
                        fontFamily: "NotoSansKR",
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () => verifyCode(),
                  ),
                ),
              ],
            ),

            SizedBox(height: 40.0),

            Text(
              '이름',
              style: TextStyle(
                fontFamily: "NotoSansKR",
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),

            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                filled: true,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.5,
                      color: Color.fromRGBO(136, 136, 136, 1),
                    )
                ),
                hintText: '이름을 입력해주세요',
                hintStyle: TextStyle(
                  fontFamily: "NotoSansKR",
                  color: Color.fromRGBO(204, 204, 204, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            SizedBox(height: 40.0),

            Text(
              '비밀번호',
              style: TextStyle(
                fontFamily: "NotoSansKR",
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),

            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.5,
                      color: Color.fromRGBO(136, 136, 136, 1),
                    )
                ),
                hintText: '비밀번호를 입력해주세요',
                hintStyle: TextStyle(
                  fontFamily: "NotoSansKR",
                  color: Color.fromRGBO(204, 204, 204, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            SizedBox(height: 40.0),

            Text(
              '비밀번호 확인',
              style: TextStyle(
                fontFamily: "NotoSansKR",
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),

            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                filled: true,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.5,
                      color: Color.fromRGBO(136, 136, 136, 1),
                    )
                ),
                hintText: '비밀번호를 입력해주세요',
                hintStyle: TextStyle(
                  fontFamily: "NotoSansKR",
                  color: Color.fromRGBO(204, 204, 204, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            SizedBox(height: 73.0),

            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  primary: Color.fromRGBO(255, 147, 101, 1),
                  minimumSize: Size(320,56),
                  // alignment: Alignment.center,
                ),
                child: Text(
                  '가입 완료',
                  style: TextStyle(
                    fontFamily: "NotoSansKR",
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  SignUp();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}