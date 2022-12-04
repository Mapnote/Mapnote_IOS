import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/search_address.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class TempAddress extends StatefulWidget {
  @override
  _TempAddressState createState() => _TempAddressState();
}
class _TempAddressState extends State<TempAddress> {
  List<Map<String, dynamic>> addressList = [];
  int addressListLength = 0;

  final _addressController = TextEditingController();

  void search() async {
    // 네이버 geocode -> 도로명 주소로만 검색 가능
    var url = 'https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=${_addressController.text}';
    var response = await http.get(Uri.parse(url),
        headers: {
          "X-NCP-APIGW-API-KEY-ID": "NAVER_CLIENT_ID",
          "X-NCP-APIGW-API-KEY": "SECRET_KEY"
    });
    var temp = json.decode(response.body);
    print(temp['addresses'][0]);
    print(temp['addresses'][1]);
    setState(() {
      addressListLength = temp['meta']['totalCount'];
    });
    print(addressListLength);

    if(addressListLength != 0) {
      for(int i=0; i<addressListLength; i++){
        addressList.add({
          'name': temp['addresses'][i]['roadAddress'],
          'latitude': temp['addresses'][i]['x'],
          'longtitude': temp['addresses'][i]['y'],
        });
      }
    };

    for(int i=0; i<addressListLength; i++) {
      print(addressList[i]);
    };
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  filled: true,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(204, 204, 204, 1),
                      )
                  ),
                  hintText: '어디서',
                  hintStyle: TextStyle(
                    fontFamily: "NotoSansKR",
                    color: Color.fromRGBO(136, 136, 136, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(CupertinoIcons.search),
              iconSize: 25,
              color: Color.fromRGBO(136, 136, 136, 1),
              onPressed: () => search(),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Color.fromRGBO(136, 136, 136, 1),
        ),
        shadowColor: Colors.transparent,
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.only(top:26),
          itemCount: addressListLength,
          itemBuilder: (context, i) {
            return Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 20),
                  Icon(
                      CupertinoIcons.placemark_fill,
                      color: Color.fromRGBO(255, 147, 101, 1),
                      size: 30
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    child: Text(
                      "${addressList[i]['name']}",
                      style: TextStyle(
                        fontFamily: "NotoSansKR",
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            );
          },
        )
      ),
    );
  }
}