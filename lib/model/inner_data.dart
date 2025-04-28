import 'package:flutter/material.dart';

class ItemModel {
  final String japName;
  final String? image;
  final String EnName;
  final Color? color;

  const ItemModel({this.image,this.color,
    required this.EnName,
    required this.japName,
});
}

