import 'package:flutter/material.dart';
import 'package:daily_kart/base/dimension.dart';

class UserRegistration extends StatefulWidget {
  static const routeName = '/user-register';

  const UserRegistration({Key? key}) : super(key: key);

  @override
  _UserRegistrationState createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  bool? _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 8, 8, 8),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),

                  TextField(
                    // controller: namecontroller,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                      fillColor: const Color(0xFFF4F4F4), filled: true,
                      // fillColor:Colors.red ,
                      prefixIcon: const Icon(Icons.person),
                      prefixStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextField(
                    // controller: namecontroller,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email Id(Optional',
                      fillColor: const Color(0xFFF4F4F4), filled: true,
                      // fillColor:Colors.red ,
                      prefixIcon: const Icon(Icons.email),
                      prefixStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextField(
                    // controller: namecontroller,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'House No',
                      fillColor: const Color(0xFFF4F4F4), filled: true,
                      // fillColor:Colors.red ,
                      prefixIcon: const Icon(Icons.house),
                      prefixStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextField(
                    // controller: namecontroller,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      hintText: 'Street',
                      fillColor: const Color(0xFFF4F4F4), filled: true,
                      // fillColor:Colors.red ,
                      prefixIcon: const Icon(Icons.streetview),
                      prefixStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextField(
                    // controller: namecontroller,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Land Mark',
                      fillColor: const Color(0xFFF4F4F4), filled: true,
                      // fillColor:Colors.red ,
                      prefixIcon: const Icon(Icons.location_city),
                      prefixStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextField(
                    // controller: namecontroller,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Current locaton',
                      fillColor: const Color(0xFFF4F4F4), filled: true,
                      // fillColor:Colors.red ,
                      prefixIcon: const Icon(Icons.stay_current_landscape),
                      prefixStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),

                  TextField(
                    // controller: namecontroller,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Referral Code(Optional)',
                      fillColor: const Color(0xFFF4F4F4), filled: true,
                      // fillColor:Colors.red ,
                      prefixIcon: const Icon(Icons.code),
                      prefixStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  CheckboxListTile(
                    title: const Text(
                        'I have read and agree to the Terms & conditions, Return policy and Privacy policy'),
                    secondary: const Icon(Icons.code),
                    autofocus: false,
                    activeColor: Colors.orange,
                    checkColor: Colors.white,
                    selected: _value as bool,
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(
                        Dimensions.paddingSizeLarge,
                      ),
                      child: Text("Register"),
                    ),
                  ),
                  // ignore: deprecated_member_use
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
