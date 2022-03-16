import 'package:flutter/material.dart';
import 'package:login/main.dart';
import 'package:login/screen_two.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenOne extends StatefulWidget {
  ScreenOne({Key? key}) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String userError = '';
  bool visibleornot = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/image2.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: visibleornot,
                    child: SizedBox(
                      child: Text(userError,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          )),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        final _username = _usernameController.text;
                        final _password = _passwordController.text;
                        if (_username == _password && _username.length >= 4) {
                          final _sharedprefs =
                              await SharedPreferences.getInstance();
                          await _sharedprefs.setBool(Save_Key_Name, true);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const ScreenTwo()),
                              (route) => false);
                        } else {
                          if (_username.length < 4) {
                            setState(() {
                              visibleornot = true;
                              userError = 'Enter atleast 4 char';
                            });
                          } else {
                            setState(() {
                              visibleornot = true;
                              userError = 'Enter a valid username & password';
                            });
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 40)),
                      child: const Text('Login'))
                ],
              ),
            ),
          )),
    );
  }
}
