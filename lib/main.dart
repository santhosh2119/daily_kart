import 'package:daily_kart/providers/location.dart';
import 'package:daily_kart/screens/home/home.dart';
import 'package:daily_kart/screens/register/locations_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/register/phone_register.dart';
import 'screens/register/verify_otp.dart';
import 'screens/register/user_registration.dart';
import 'screens/register/login.dart';

import 'package:daily_kart/providers/auth.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (_) => Location(),
        ),
      ],
      child: MaterialApp(
        title: 'Daily Kart',
        theme: ThemeData(
          primarySwatch: colorCustomM,
        ),
        home: const LocationScreen(),
        routes: {
          VerifyOtp.routeName: (ctx) => const VerifyOtp(),
          UserRegistration.routeName: (ctx) => const UserRegistration(),
          Login.routeName: (ctx) => const Login(),
          Home.routeName: (ctx) => const Home(),
          PhoneRegister.routeName: (ctx) => const PhoneRegister(),
        },
      ),
    );
  }
}
