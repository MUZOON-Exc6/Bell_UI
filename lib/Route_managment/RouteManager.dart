import 'package:flutter/material.dart';
import 'package:signup/views/SignUpScreen.dart';

class RouteManager {
static Route <dynamic>? routManager (RouteSettings settings){

switch (settings.name){
  case '/signup': return MaterialPageRoute(builder: (ctx)=> SignUpScreen());
}

}
}