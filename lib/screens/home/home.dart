import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const routeName = '/home';


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("HOme"),
      ),
    );
  }
}
