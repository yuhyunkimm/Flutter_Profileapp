
import 'package:flutter/material.dart';

ThemeData theme(){
  return ThemeData(
    primaryColor: Colors.white, // primary키 색은 블루로 다른색을 지정해도 바뀌지 않느다
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.blue)
    ),
  );
}