import 'package:flutter/material.dart';
import 'package:kopo/kopo.dart';
import 'dart:ui';

class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  String adressValue = "주소를 검색해주세요";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('17. Flutter tutorial KOR Adress'),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(this.adressValue),
            ElevatedButton(
              child: Text("주소 검색"),
              onPressed: () async {
                var result = await Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => Kopo()
                    )
                );

                if(result != null){
                  setState(() {
                    this.adressValue = result;
                  });
                }
              },
            )
          ],
        ),
      ),

    );
  }
}