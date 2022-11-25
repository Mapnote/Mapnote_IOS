import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  '맵노트에 오신 것을 환영합니다!',
                  style: TextStyle(
                    fontFamily: "NotoSansKR",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 8.0),

                Text(
                  '서비스 이용을 위해 로그인이 필요합니다.',
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
              controller: _usernameController,
              decoration: InputDecoration(
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(248, 248, 248, 1),
                  )
                ),
                hintText: '이메일',
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
                hintText: '비밀번호',
              ),
              obscureText: true,  // 비밀번호 입력시 별표
            ),

            SizedBox(height: 30.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '아이디 찾기',
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
                    onPressed: () {},
                    child: Text(
                      '비밀번호 찾기',
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
                    onPressed: () {},
                    child: Text(
                      '회원가입',
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
                  '로그인',
                  style: TextStyle(
                    fontFamily: "NotoSansKR",
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {},
              ),
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
                  '간편 로그인',
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

            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)
                  ),
                  primary: Color.fromRGBO(254, 229, 0, 1),
                  minimumSize: Size(319,48),
                  // alignment: Alignment.center,
                ),
                child: Text(
                  '카카오톡으로 시작하기',
                  style: TextStyle(
                    fontFamily: "NotoSansKR",
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {},
              ),
            ),

          ],
        ),
      ),
    );
  }
}

// TODO
// ios 버전 쿠퍼티노 버튼 -> 사이즈 문제로 일단 보류

// Center(
// child: CupertinoButton(
// borderRadius: BorderRadius.circular(8.0),
// color: Color.fromRGBO(255, 147, 101, 1),
// minSize: 100,
// child: Text(
// '로그인',
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

// button 종류 참고용

// ButtonBar(
// children: <Widget>[
// FlatButton(
// child: Text('CANCEL'),
// onPressed: () {
// _usernameController.clear();
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