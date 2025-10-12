import 'package:flutter/cupertino.dart';
import 'package:news_app_offline/features/home/home.dart';
import 'package:news_app_offline/features/splash/splash.dart';

abstract class RoutesManager{
  static const String splash= "/splash";
  static const String home= "/home";
  static Map<String, WidgetBuilder> routes = {
    splash: (context)=> Splash(),
    home: (context)=> Home()
  };
}