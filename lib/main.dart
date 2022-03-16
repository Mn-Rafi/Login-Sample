import 'package:flutter/material.dart';
import 'package:login/splash_screen.dart';

const Save_Key_Name ='UserEnteredValue';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: SplashScreen()
    );
  }
}