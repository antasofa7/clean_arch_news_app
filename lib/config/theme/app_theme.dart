import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Muli',
      appBarTheme: _appBarTheme());
}

AppBarTheme _appBarTheme() {
  return const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Color(0xff8B8B8B)),
      titleTextStyle: TextStyle(color: Color(0xff8B8B8B), fontSize: 18.0));
}
