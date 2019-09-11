import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import './screens/login.dart';
import './screens/register.dart';
import './screens/map.dart';
import './screens/start-page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() =>  runApp(new HelloFlutterApp());


class HelloFlutterApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: "KeGo",
      home: 
        // Scaffold(appBar: AppBar(title: Text("My First App"),
        
        // ),
        
        // body: Home(),

        // ),
        Scaffold(body: Map()
        
        // Container(
        //    decoration: BoxDecoration(
        //      image: DecorationImage(
        //        image: AssetImage('images/alarm.jpg'),
        //        fit: BoxFit.cover
        //      )
        //    ),
        //   child:Login()
        
        // )
      )
      
      
      
    )
  ;
  }
  
  
}
