import 'package:flutter/material.dart';

class Notice{
  IconData iconImg;
  String location;   //final, const
  String content;
  String date;

  Notice(this.iconImg,this.location,this.content,this.date);
}