
import 'package:daily_kart/widgets/coustom_button.dart';
import 'package:daily_kart/widgets/coustom_input_text_field.dart';
import 'package:daily_kart/widgets/coustom_space.dart';
import 'package:flutter/material.dart';

class UserRegistration extends StatefulWidget {
  static const routeName = '/user-register';
  const UserRegistration({Key? key}) : super(key: key);
  @override
  _UserRegistrationState createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _houseNo = TextEditingController();
  final TextEditingController _street = TextEditingController();
  final TextEditingController _landmark = TextEditingController();
  final TextEditingController _currentLocation = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _optional = TextEditingController();

  _register() {
    if (_formKey.currentState!.validate()) {}
  }


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 8, 8, 8),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CoustomSpace(),

                  CoustomInputField(
                    controller: _fullName,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value.length > 3) {
                        return null;
                      }
                      return "Please Enter valid FullName";
                    },
                    labelText: "Full Name",
                  ),

                  const CoustomSpace(),
                  CoustomInputField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value.contains('@')) {
                        return null;
                      }
                      return "Please Enter valid  Email";
                    },
                    labelText: "Email",
                  ),
                  const CoustomSpace(),

                  CoustomInputField(
                    controller: _houseNo,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.length > 1) {
                        return null;
                      }
                      return "Please Enter valid  House No";
                    },
                    labelText: "House No",
                  ),
                  const CoustomSpace(),
                  CoustomInputField(
                    controller: _street,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.length > 2) {
                        return null;
                      }
                      return "Please Enter valid  Street No";
                    },
                    labelText: "Street No",
                  ),
                  const CoustomSpace(),

                  CoustomInputField(
                    controller: _landmark,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.length > 2) {
                        return null;
                      }
                      return 'Please Enter valid  Landmark';
                    },
                    labelText: "Landmark",
                  ),
                  const CoustomSpace(),
                  CoustomInputField(
                    controller: _currentLocation,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.length > 2) {
                        return null;
                      }
                      return 'Please Enter valid  Current Location';
                    },
                    labelText: "Current Location",
                  ),
                  const CoustomSpace(),
                  CoustomInputField(
                    controller: _password,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.length > 4) {
                        return null;
                      }
                      return 'Please Enter Atleast 4 characters';
                    },
                    labelText: "Password",
                  ),
                  const CoustomSpace(),
                  CoustomInputField(
                    controller: _optional,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (value) {},
                    labelText: "Referal",
                  ),
                  const CoustomSpace(),

                  CoustomButton(onPressed: _register, text: "Register"),
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
