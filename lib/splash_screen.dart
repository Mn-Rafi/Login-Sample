import 'package:flutter/material.dart';
import 'package:login/main.dart';
import 'package:login/screen_one.dart';
import 'package:login/screen_two.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    super.initState();
    checkUserDone();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(image: AssetImage('images/image1.gif')),
      ),
    );
  }

  _navigatetohome() async {
      await Future.delayed(const Duration(milliseconds: 3000));
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ScreenOne()));
    }

  checkUserDone() async {
    final _sharedprfs = await SharedPreferences.getInstance();
    final _userloggedIn=_sharedprfs.getBool(Save_Key_Name);
    if(_userloggedIn==null|| _userloggedIn==false){
      
    _navigatetohome(); 
    }else{
      await Future.delayed(const Duration(milliseconds: 3000));
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ScreenTwo()));
    }

  }

}