import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login/login_page.dart';

class FindPwComplete extends StatefulWidget {
  @override
  _FindPwCompleteState createState() => _FindPwCompleteState();
}

class _FindPwCompleteState extends State<FindPwComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          children: <Widget>[
            SizedBox(height: 170.0),
            Column(
              children: <Widget>[
                Text(
                  '비밀번호 재설정 URL이 이메일로 발송되었습니다.',
                  style: TextStyle(
                    fontFamily: "NotoSansKR",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 12.0),

                Container(
                  child: Text(
                    '입력하신 이메일 주소로\n비밀번호 재설정 URL이 발송되었습니다.\n이메일 수신함에서 확인해보세요.',
                    style: TextStyle(
                      fontFamily: "NotoSansK신R",
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),

            SizedBox(height: 300.0),

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
                  '완료',
                  style: TextStyle(
                    fontFamily: "NotoSansKR",
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => LoginPage())
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}