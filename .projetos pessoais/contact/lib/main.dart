import 'package:contact/android/android_app.dart';
import 'package:contact/ios/ios_app.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;


void main() {
  if (Platform.isAndroid) {
    runApp(const AndroidApp());
  } else if (Platform.isIOS) {
    runApp(const IOSApp());
  }
}

