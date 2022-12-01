import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login/find_pw_complete.dart';

class FindPw extends StatefulWidget {
  @override
  _FindPwState createState() => _FindPwState();
}

class _FindPwState extends State<FindPw> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();

  bool isEmailVerified = false;
  bool isCodeVerified = false;

  void verifyEmail() {
    // TODO: 이메일 인증 기능 구현하기
    isEmailVerified = true;
    print(_emailController.text);
    print(_emailController.text is String);
  }

  void verifyCode() {
    // TODO: 인증코드 확 기능 구현하기
    isCodeVerified = true;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          children: <Widget>[
            SizedBox(height: 30.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '가입한 이메일로 찾기',
                  style: TextStyle(
                    fontFamily: "NotoSansKR",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 6.0),

                Text(
                  '가입 당시 사용한 이메일과 이름을 입력해주세요.',
                  style: TextStyle(
                    fontFamily: "NotoSansKR",
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: 50.0),
              ],
            ),

            SizedBox(height: 30.0),

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
                      '인증하기',
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

            SizedBox(height: 129.0),

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
                  '비밀번호 찾기',
                  style: TextStyle(
                    fontFamily: "NotoSansKR",
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => FindPwComplete())
                  );
                },
              ),
            ),

            SizedBox(height: 81.0),
          ],
        ),
      ),
    );
  }
}