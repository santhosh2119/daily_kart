import 'package:flutter/material.dart';
import 'screens/register/phone_register.dart';
import 'screens/register/verify_otp.dart';
import 'screens/register/user_registration.dart';
import 'screens/register/login.dart';

void main() {
  runApp(const MyApp());
}

Map<int, Color> color = const {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustomM = MaterialColor(0xff66b88c, color);
    // MaterialColor colorCustomS = MaterialColor(0xFFffffff, color);
    return MaterialApp(
      title: 'Daily Kart',
      theme: ThemeData(
        primarySwatch: colorCustomM,
      ),
      home: const PhoneRegister(),
      routes: {
        VerifyOtp.routeName: (ctx) => VerifyOtp(),
        UserRegistration.routeName: (ctx) => UserRegistration(),
        Login.routeName: (ctx) => Login(),
      },
    );
  }
}
