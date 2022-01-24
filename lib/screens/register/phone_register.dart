import 'package:daily_kart/base/dimension.dart';
import 'package:daily_kart/screens/register/login.dart';
import 'package:flutter/material.dart';
import 'verify_otp.dart';

class PhoneRegister extends StatefulWidget {
  const PhoneRegister({Key? key}) : super(key: key);

  @override
  _PhoneRegisterState createState() => _PhoneRegisterState();
}

class _PhoneRegisterState extends State<PhoneRegister> {
  final TextEditingController _phoneController = TextEditingController();

  Future<void> _registerphone() async {
    Navigator.of(context).pushNamed(VerifyOtp.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 300,
                  child: Image.asset('assets/images/logo.jpg'),
                  padding: const EdgeInsets.only(bottom: 20),
                ),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  maxLength: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                ElevatedButton(
                  onPressed: _registerphone,
                  child: const Padding(
                    padding: EdgeInsets.all(
                      Dimensions.paddingSizeLarge,
                    ),
                    child: Text("Send OTP"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(Login.routeName);
                        },
                        child: const Text('Already have an account log in'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
