import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_note/mapnote_main.dart';

import '../model/search_address.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class TempAddress extends StatefulWidget {
  @override
  _TempAddressState createState() => _TempAddressState();
}
class _TempAddressState extends State<TempAddress> {
  List<Map<String, dynamic>> addressList = [];
  int addressListLength = 0;

  final _addressController = TextEditingController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //
  //   resetPrefState();
  // }

  void search() async {
    // 네이버 geocode -> 도로명 주소로만 검색 가능
    var url = 'https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=${_addressController.text}';
    var response = await http.get(Uri.parse(url),
        headers: {
          "X-NCP-APIGW-API-KEY-ID": "CLIENT_ID",
          "X-NCP-APIGW-API-KEY": "SECRET_KEY"
    });
    var temp = json.decode(response.body);
    setState(() {
      addressListLength = temp['meta']['totalCount'];
    });

    if(addressListLength != 0) {
      for(int i=0; i<addressListLength; i++){
        addressList.add({
          'name': temp['addresses'][i]['roadAddress'],
          'roadAddress': temp['addresses'][i]['roadAddress'],
          'latitude': temp['addresses'][i]['x'],
          'longtitude': temp['addresses'][i]['y'],
          'jibunAddress': temp['addresses'][i]['jibunAddress'],
        });
      }
    };

    for(int i=0; i<addressListLength; i++) {
      print(addressList[i]);
    };
  }

  void saveAddress(dynamic address) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('selectedAddressName', address['name']);
    prefs.setString('selectedAddressLat', address['latitude']);
    prefs.setString('selectedAddressLong', address['longtitude']);
    prefs.setString('selectedRoadAddress', address['roadAddress']);
    prefs.setString('selectedJibunAddress', address['jibunAddress']);

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => MapnoteMain())
    );
  }

  // void resetPrefState() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   prefs.clear();
  //
  //
  //   print('resetState');
  //   print(prefs.getKeys());
  // }


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
                    onPressed: () => saveAddress(addressList[i]),
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