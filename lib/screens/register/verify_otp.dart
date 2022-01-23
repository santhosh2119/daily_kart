import 'package:flutter/material.dart';
import 'package:daily_kart/base/dimension.dart';
import 'user_registration.dart';

class VerifyOtp extends StatefulWidget {
  static const routeName = '/verifyotp';
  const VerifyOtp({Key? key}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
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
                  // controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  maxLength: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(UserRegistration.routeName);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(
                      Dimensions.paddingSizeLarge,
                    ),
                    child: Text("Verify"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
