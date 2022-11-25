import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Join extends StatefulWidget {
  @override
  _JoinState createState() => _JoinState();
}

class _JoinState extends State<Join> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

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
                    controller: _passwordController,
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
                    onPressed: () {},
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
                    controller: _passwordController,
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
                    onPressed: () {},
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
              controller: _usernameController,
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
              controller: _usernameController,
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
              controller: _usernameController,
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
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}