import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final theme = ThemeData(
  cupertinoOverrideTheme: const CupertinoThemeData(
    textTheme: CupertinoTextThemeData(
      primaryColor: Colors.black,
    ), // This is required
  ),
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.black,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.black, //修改颜色
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ),
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
);
