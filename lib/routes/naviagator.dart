import 'package:competition/utils/corps.dart';
import 'package:competition/views/login.dart';
import 'package:competition/views/register.dart';
import 'package:flutter/material.dart';

class NavApp {
  NavApp._();

  static const String authConnect = '/auth-Connect';
  static const String authReg = '/auth-Reg';
  static const String corps = '/corps';

  static Map<String, WidgetBuilder> define() {
    return {
      authConnect: (context) => Connect(),
      authReg: (context) => Reg(),
      corps: (context) => Corpus(),
    };
  }
}
